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

  void testFollowProfileCreateFollowProfile() {
    println "= creating profile1"
    def profile1 = new Profile(identity: "openecho")
    assertNotNull(profile1.save(flush: true))
    println "= profile1 created {$profile1.id}"
    println "= creating profile2"
    def profile2 = new Profile(identity: "seeder org")
    assertNotNull(profile2.save(flush: true))
    println "= profile2 created {$profile2.id}"

    println "= creating follow1"
    def follow1 = new ProfileRelationship(source: profile1, target: profile2, type: ProfileRelationship.Type.FOLLOW);
    assertNotNull(follow1.save(flush:true))
    println "= follow1 created {$follow1.id}"

    profile1.refresh()
    profile2.refresh()

    assertEquals(1, profile1.following().size())
    assertEquals(0, profile2.following().size())
    assertEquals(0, profile1.followedBy().size())
    assertEquals(1, profile2.followedBy().size())
  }

  void testAddToFollowing() {
    println "= profile1 follow profile2"
    def profile1 = new Profile(identity: "openecho")
    assertNotNull(profile1.save(flush: true))
    def profile2 = new Profile(identity: "seeder org")
    assertNotNull(profile2.save(flush: true))

    profile1.addToFollowing(profile2)
    assertNotNull(profile1.save(flush: true))
    profile1.refresh()
    profile2.refresh()
    assertEquals(1, profile1.following().size())
    assertEquals(0, profile1.followedBy().size())
    assertEquals(0, profile2.following().size())
    assertEquals(1, profile2.followedBy().size())
  }


  void testRemoveFromFollowing() {
    def profile1 = new Profile(identity: "openecho")
    assertNotNull(profile1.save(flush: true))
    def profile2 = new Profile(identity: "seeder org")
    assertNotNull(profile2.save(flush: true))

    profile1.addToFollowing(profile2)
    assertNotNull(profile1.save(flush: true))
    profile1.refresh()
    profile2.refresh()
    assertEquals(1, profile1.following().size())
    assertEquals(0, profile1.followedBy().size())
    assertEquals(0, profile2.following().size())
    assertEquals(1, profile2.followedBy().size())

    profile1.removeFromFollowing(profile2)
    assertNotNull(profile1.save(flush: true))
    profile1.refresh()
    profile2.refresh()
    assertEquals(0, profile1.following().size())
    assertEquals(0, profile1.followedBy().size())
    assertEquals(0, profile2.following().size())
    assertEquals(0, profile2.followedBy().size())
  }

  void testAddToBlocking() {
    println "= profile1 block profile2"
    def profile1 = new Profile(identity: "openecho")
    assertNotNull(profile1.save(flush: true))
    def profile2 = new Profile(identity: "seeder org")
    assertNotNull(profile2.save(flush: true))

    profile1.addToBlocking(profile2)
    assertNotNull(profile1.save(flush: true))
    profile1.refresh()
    profile2.refresh()
    assertEquals(1, profile1.blocked().size())
    assertEquals(0, profile1.blockedBy().size())
    assertEquals(0, profile2.blocked().size())
    assertEquals(1, profile2.blockedBy().size())
  }

  void testRemoveFromBlocking() {
    def profile1 = new Profile(identity: "openecho")
    assertNotNull(profile1.save(flush: true))
    def profile2 = new Profile(identity: "seeder org")
    assertNotNull(profile2.save(flush: true))

    profile1.addToBlocking(profile2)
    assertNotNull(profile1.save(flush: true))
    profile1.refresh()
    profile2.refresh()
    assertEquals(1, profile1.blocked().size())
    assertEquals(0, profile1.blockedBy().size())
    assertEquals(0, profile2.blocked().size())
    assertEquals(1, profile2.blockedBy().size())

    profile1.removeFromBlocking(profile2)
    assertNotNull(profile1.save(flush: true))
    profile1.refresh()
    profile2.refresh()
    assertEquals(0, profile1.blocked().size())
    assertEquals(0, profile1.blockedBy().size())
    assertEquals(0, profile2.blocked().size())
    assertEquals(0, profile2.blockedBy().size())

    profile1.addToBlocking(profile2)
    assertNotNull(profile1.save(flush: true))
    profile1.refresh()
    profile2.refresh()
    assertEquals(1, profile1.blocked().size())
    assertEquals(0, profile1.blockedBy().size())
    assertEquals(0, profile2.blocked().size())
    assertEquals(1, profile2.blockedBy().size())

    def profile3 = new Profile(identity: "sam")
    assertNotNull(profile3.save(flush: true))
    def profile4 = new Profile(identity: "ben")
    assertNotNull(profile4.save(flush: true))
    profile1.addToBlocking(profile3)
    profile1.addToBlocking(profile4)
    assertNotNull(profile1.save(flush: true))
    profile1.refresh()
    profile3.refresh()
    profile4.refresh()
    assertEquals(3, profile1.blocked().size())
    assertEquals(0, profile1.blockedBy().size())
    assertEquals(0, profile2.blocked().size())
    assertEquals(1, profile2.blockedBy().size())
    assertEquals(0, profile3.blocked().size())
    assertEquals(1, profile3.blockedBy().size())
    assertEquals(0, profile4.blocked().size())
    assertEquals(1, profile4.blockedBy().size())

    profile2.addToBlocking(profile4)
    assertNotNull(profile2.save(flush: true))
    profile1.refresh()
    profile2.refresh()
    profile3.refresh()
    profile4.refresh()
    assertEquals(3, profile1.blocked().size())
    assertEquals(0, profile1.blockedBy().size())
    assertEquals(1, profile2.blocked().size())
    assertEquals(1, profile2.blockedBy().size())
    assertEquals(0, profile3.blocked().size())
    assertEquals(1, profile3.blockedBy().size())
    assertEquals(0, profile4.blocked().size())
    assertEquals(2, profile4.blockedBy().size())
  }

  void testAddToFriends() {
    println "= profile1 friend profile2"
    def profile1 = new Profile(identity: "openecho")
    assertNotNull(profile1.save(flush: true))
    def profile2 = new Profile(identity: "seeder org")
    assertNotNull(profile2.save(flush: true))

    profile1.addToFriends(profile2)
    assertNotNull(profile1.save(flush: true))
    profile1.refresh()
    profile2.refresh()
    assertEquals(1, profile1.friends().size())
    assertEquals(1, profile2.friends().size())
  }

  void testRemoveFromFriends() {
    println "= profile1 friend profile2"
    def profile1 = new Profile(identity: "openecho")
    assertNotNull(profile1.save(flush: true))
    def profile2 = new Profile(identity: "seeder org")
    assertNotNull(profile2.save(flush: true))

    profile1.addToFriends(profile2)
    assertNotNull(profile1.save(flush: true))
    assertEquals(1, profile1.friends().size())
    assertEquals(1, profile2.friends().size())
    profile1.refresh()
    profile2.refresh()
    assertEquals(1, profile1.friends().size())
    assertEquals(1, profile2.friends().size())

    profile1.removeFromFriends(profile2)
    assertNotNull(profile1.save(flush: true))
    assertEquals(0, profile1.friends().size())
    assertEquals(0, profile2.friends().size())
    profile1.refresh()
    profile2.refresh()
    assertEquals(0, profile1.friends().size())
    assertEquals(0, profile2.friends().size())
  }
}
