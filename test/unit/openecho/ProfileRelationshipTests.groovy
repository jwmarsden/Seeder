package openecho

import grails.test.*

class ProfileRelationshipTests extends GrailsUnitTestCase {
  
  protected void setUp() {
    super.setUp()
  }

  protected void tearDown() {
    super.tearDown()
  }

  void testCreate() {
    mockDomain(Profile)
    mockDomain(ProfileRelationship)
    def profile1 = new Profile(identity: "openecho")
    assertNotNull(profile1.save())
    def profile2 = new Profile(identity: "seeder org")
    assertNotNull(profile2.save())
    def follow1 = new ProfileRelationship()
    follow1.setSource(profile1)
    follow1.setTarget(profile2)
    assertNotNull(follow1.save())
  }
}
