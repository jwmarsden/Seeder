package openecho

import grails.test.*

class ProfileIntegrationTests extends GrailsUnitTestCase {
  protected void setUp() {
    super.setUp()
  }

  protected void tearDown() {
    super.tearDown()
  }

  void testCreateNewProfile() {
    def emptyProfile = new Profile()
    assertNull(emptyProfile.save())
    def profile = new Profile(identity: "openecho")
    assertNotNull(profile.save())
  }

  void testCreateNewProfileWithUser() {
    def user = new User(userName: 'jwm', newPassword: 'mwjwm', type: "LOCAL", email: 'jwm@gmail.com')
    assertNotNull(user.save())
    def profile = new Profile(identity: "openecho")
    assertNotNull(profile.save())
    profile.addToUsers(user);
    assertNotNull(profile.save())
  }

  void testCreateNewProfileWithMultiUsers() {
    // Create some users
    def user1 = new User(userName: 'jwm', newPassword: 'mwjwm', type: "LOCAL", email: 'jwm@gmail.com')
    assertNotNull(user1.save())
    def user2 = new User(userName: 'mwj', newPassword: 'mwjwm', type: "LOCAL", email: 'mwj@gmail.com')
    assertNotNull(user1.save())
    // Create Profile
    def profile = new Profile(identity: "seeder org")
    assertNotNull(profile.save())
    // Add users to profile
    user1.addToProfiles(profile)
    assertNotNull(user1.save())
    user2.addToProfiles(profile)
    assertNotNull(user2.save())
    assertEquals(profile.users.size(), 2)
    assertEquals(user1.profiles.size(), 1)
    assertEquals(user2.profiles.size(), 1)
    // Create another User
    def user3 = new User(userName: 'pre', newPassword: 'prepre', type: "LOCAL", email: 'pre@gmail.com')
    assertNotNull(user3.save())
    // Add profile to User
    profile.addToUsers(user3)
    assertNotNull(profile.save())
    assertEquals(profile.users.size(), 3)
    assertEquals(user3.profiles.size(), 1)
  }
}
