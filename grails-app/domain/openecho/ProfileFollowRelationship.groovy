package openecho

class ProfileFollowRelationship extends ProfileRelationship {

  static mapping = {
    discriminator value: "FOLLOW"
  }

  String label() {
    "Follows"
  }

  static ProfileRelationship relate(sourceInput, targetInput) {
    def prSet = ProfileFollowRelationship.createCriteria().list {
      and {
        source { eq('identity', sourceInput.identity) }
        target { eq('identity', targetInput.identity) }
      }
    }
    def pr = null;
    if (prSet) {
      pr = prSet.get(0)
    }
    if(!pr) {
      pr = new ProfileFollowRelationship(source: sourceInput, target: targetInput)
      sourceInput?.addToProfilesFollowing(pr)
      targetInput?.addToFollowerProfiles(pr)
    }
    return pr
  }

  static void unRelate(sourceInput, targetInput) {
    def prSet = ProfileFollowRelationship.createCriteria().list {
      and {
        source { eq('identity', sourceInput.identity) }
        target { eq('identity', targetInput.identity) }
      }
    }
    if (prSet)
    {
      def pr = prSet.get(0)
      sourceInput?.removeFromProfilesFollowing(pr)
      targetInput?.removeFromFollowerProfiles(pr)
      pr.delete(flush: true)
    }
  }
}