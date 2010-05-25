package openecho

import grails.test.*

class UserIntegrationTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

  void testCreateNewUser() {
    def user = new User(userName: 'jwm', newPassword: 'mwjwm', type: "LOCAL", email: 'jwm@gmail.com')
    assertNotNull(user.save())
    assertNotNull(user.id)
    def foundUser = User.get(user.id)
    assertEquals 'jwm', foundUser.userName
  }
}
