package openecho

import grails.test.*

class UserTests extends GrailsUnitTestCase {
  
  protected void setUp() {
    super.setUp()
  }

  protected void tearDown() {
    super.tearDown()
  }

  void testCreateNewUser() {
    mockDomain(User)
    def user = new User(userName: 'jwm', newPassword: 'mwjwm', type: "LOCAL", email: 'jwm@gmail.com')
    assertNotNull(user.save())
    assertNotNull(user.id)
    def foundUser = User.get(user.id)
    assertEquals 'jwm', foundUser.userName
  }

  void testCreateNonUniqueUser() {
    mockDomain(User)
    def user = new User(userName: 'jwm', newPassword: 'mwjwm', type: "LOCAL", email: 'jwm@gmail.com')
    assertNotNull(user.save())
    user = new User(userName: 'jwm', newPassword: 'mwjwm', type: "LOCAL", email: 'jwm2@gmail.com')
    assertNull(user.save())
  }

  void testCreateUserWithSamePasswordUser() {
    mockDomain(User)
    def user = new User(username: 'username', newPassword: 'username', type: "LOCAL", email: 'jwm@gmail.com')
    assertNull(user.save())
  }
}
