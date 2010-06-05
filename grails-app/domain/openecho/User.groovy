package openecho

import openecho.Role

/**
 * User domain class.
 */
class User {
  static hasMany = [ profiles : Profile, authorities: Role]
  static belongsTo = [ Profile, Role ]

  static transients = ['pass']

  static mapping = {
    profiles lazy:false
  }
  
  /** Username */
  String username
  String userRealName
  /** MD5 Password */
  String passwd
  /** enabled */
  boolean enabled

  String email
  boolean emailShow

  /** description */
  String description = ''

  /** plain password to create a MD5 password */
  String pass = '[secret]'

  String type="LOCAL"
  
  Date dateCreated
  Date lastUpdated

  static constraints = {
    username(blank: false, unique: true)
    userRealName(nullable: true)
    passwd(nullable: false, blank: false)
    email(nullable: false, blank: false)
    enabled()
    type(nullable: false, blank: false, inList:["LOCAL","OPEN_ID"])
  }

  String toString() {
    "User for ${username} (${id})"
  }
}
