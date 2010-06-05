package openecho

import grails.test.*

class RoleIntegrationTestTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testCreateRole() {
        def emptyRole = new Role()
        assertNull(emptyRole.save())
        def role = new Role(authority:"ROLE_TEST", description:"Role for Users")
        role.validate()
        println role.errors
        assertNotNull(role.save())
    }
}
