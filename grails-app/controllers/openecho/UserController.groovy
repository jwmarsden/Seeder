package openecho

import openecho.User
import openecho.Role
import com.megatome.grails.RecaptchaService

/**
 * User controller.
 */
class UserController {

  def authenticateService
  RecaptchaService recaptchaService

  // the delete, save and update actions only accept POST requests
  static Map allowedMethods = [delete: 'POST', save: 'POST', update: 'POST']

  def index = {
    redirect action: list, params: params
  }

  def list = {
    if (!params.max) {
      params.max = 10
    }
    [personList: User.list(params)]
  }


    def register = {
        log.debug("Enter UserController.register(" + request.getMethod() + ", " + params.toString() + ")")
        def person = new User()
        person.properties = params
        if(request.getMethod() == "GET") {
            render view: 'register', model: [authorityList: Role.list(), person: person]
        } else if (request.getMethod() == "POST") {
            def recaptchaVerify = recaptchaService.verifyAnswer(session, request.getRemoteAddr(), params)
            if (!recaptchaVerify) {
                render view: 'register', model: [authorityList: Role.list(), person: person]
            } else {

              if(params.passwd) {
                person.passwd = authenticateService.encodePassword(params.passwd)
              }
              addRoles(person)
              if(person.save()) {
                redirect action: show, id: person.id
              } else {
                recaptchaService.cleanUp(session)
                render view: 'register', model: [authorityList: Role.list(), person: person]
              }
            }
        } else {
            log.debug("Other Request!")
        }
    }


  def show = {
    def person = User.get(params.id)
    if (!person) {
      flash.message = "User not found with id $params.id"
      redirect action: list
      return
    }
    List roleNames = []
    for (role in person.authorities) {
      roleNames << role.authority
    }
    roleNames.sort { n1, n2 ->
      n1 <=> n2
    }
    [person: person, roleNames: roleNames]
  }

  /**
   * Person delete action. Before removing an existing person,
   * he should be removed from those authorities which he is involved.
   */
  def delete = {

    def person = User.get(params.id)
    if (person) {
      def authPrincipal = authenticateService.principal()
      //avoid self-delete if the logged-in user is an admin
      if (!(authPrincipal instanceof String) && authPrincipal.username == person.username) {
        flash.message = "You can not delete yourself, please login as another admin and try again"
      }
      else {
        //first, delete this person from People_Authorities table.
        Role.findAll().each { it.removeFromPeople(person) }
        person.delete()
        flash.message = "User $params.id deleted."
      }
    }
    else {
      flash.message = "User not found with id $params.id"
    }

    redirect action: list
  }

  def edit = {

    def person = User.get(params.id)
    if (!person) {
      flash.message = "User not found with id $params.id"
      redirect action: list
      return
    }

    return buildPersonModel(person)
  }

  /**
   * Person update action.
   */
  def update = {

    def person = User.get(params.id)
    if (!person) {
      flash.message = "User not found with id $params.id"
      redirect action: edit, id: params.id
      return
    }

    long version = params.version.toLong()
    if (person.version > version) {
      person.errors.rejectValue 'version', "person.optimistic.locking.failure",
              "Another user has updated this User while you were editing."
      render view: 'edit', model: buildPersonModel(person)
      return
    }

    def oldPassword = person.passwd
    person.properties = params
    if (!params.passwd.equals(oldPassword)) {
      person.passwd = authenticateService.encodePassword(params.passwd)
    }
    if (person.save()) {
      Role.findAll().each { it.removeFromPeople(person) }
      addRoles(person)
      redirect action: show, id: person.id
    }
    else {
      render view: 'edit', model: buildPersonModel(person)
    }
  }

  def create = {
    [person: new User(params), authorityList: Role.list()]
  }

  /**
   * Person save action.
   */
  def save = {

    def person = new User()
    person.properties = params
    person.passwd = authenticateService.encodePassword(params.passwd)
    if (person.save()) {
      addRoles(person)
      redirect action: show, id: person.id
    }
    else {
      render view: 'create', model: [authorityList: Role.list(), person: person]
    }
  }
//
//  def register = {
//      [person: new User(params)]
//  }
//
// def register_save = {
//    def person = new User()
//    person.properties = params
//    person.passwd = authenticateService.encodePassword(params.passwd)
//    if (person.save()) {
//      addRoles(person)
//      redirect action: show, id: person.id
//    }
//    else {
//      render view: 'register', model: [authorityList: Role.list(), person: person]
//    }
//  }


   

  private void addRoles(person) {
    for (String key in params.keySet()) {
      if (key.contains('ROLE') && 'on' == params.get(key)) {
        Role.findByAuthority(key).addToPeople(person)
      }
    }
  }

  private Map buildPersonModel(person) {

    List roles = Role.list()
    roles.sort { r1, r2 ->
      r1.authority <=> r2.authority
    }
    Set userRoleNames = []
    for (role in person.authorities) {
      userRoleNames << role.authority
    }
    LinkedHashMap<Role, Boolean> roleMap = [:]
    for (role in roles) {
      roleMap[(role)] = userRoleNames.contains(role.authority)
    }

    return [person: person, roleMap: roleMap]
  }
}
