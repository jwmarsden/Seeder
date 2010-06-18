package openecho

import openecho.Role

/**
* User domain class.
*/
class User {
    static hasMany = [ profiles : Profile, authorities: Role]
    static belongsTo = [ Profile, Role ]

    static transients = ['pass','passVerify']

    static mapping = {
        profiles lazy:false
    }

    /** Username */
    String username

    /** MD5 Password */
    String passwd
    /** enabled */
    boolean enabled

    String email
    boolean emailShow
    boolean requiresVerificationEmail

    /** description */
    String description = ''

    /** plain password to create a MD5 password */
    String pass
    String passVerify

    String type="LOCAL"

    String uuid

    Date dateCreated
    Date lastUpdated

    static constraints = {
        username(blank: false, unique: true)
        passwd(nullable: false, blank: false)
        email(nullable: false, blank: false, email: true)
        type(nullable: false, blank: false, inList:["LOCAL","OPEN_ID"])
        uuid(nullable: true, blank: true)
    }

    transient beforeInsert = {
        uuid = java.util.UUID.randomUUID().toString()
    }

    String toString() {
        "User for ${username} (${id})"
    }
}
