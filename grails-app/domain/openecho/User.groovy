package openecho

class User {
  static transients = [ "newPassword" ]

  static hasMany = [ profiles : Profile ]
  static belongsTo = Profile

  String userName
  String password
  String type
  String email
  Date dateCreated
  Date lastUpdated

  static constraints = {
    userName(size:3..150, unique: true)
    password(nullable: false)
    type(nullable: false, inList:["LOCAL","OPEN_ID"])
    email(email: true, nullable: true)
  }

  void setNewPassword(String newPassword) {
    password = newPassword
  }

  String getNewPassword() {
    return null
  }

  String toString() {
    "User for ${userName} (${id})"
  }
}
