security {

    // see DefaultSecurityConfig.groovy for all settable/overridable properties

    active = true

    defaultRole = 'ROLE_USER'

    loginUserDomainClass = "openecho.User"
    authorityDomainClass = "openecho.Role"
    requestMapClass = "openecho.Requestmap"
}
