package openecho

class ProfileBlockedRelationship extends ProfileRelationship {

  static mapping = {
    discriminator value: "BLOCKED"
  }

  String label() {
    "Blocks"
  }

  static ProfileRelationship relate(sourceInput, targetInput) {
    def prSet = ProfileBlockedRelationship.createCriteria().list {
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
      pr = new ProfileBlockedRelationship(source: sourceInput, target: targetInput)
      sourceInput?.addToProfilesBlocked(pr)
      targetInput?.addToBlockedByProfiles(pr)
    }
    return pr
  }

  static void unRelate(sourceInput, targetInput) {
    def prSet = ProfileBlockedRelationship.createCriteria().list {
      and {
        source { eq('identity', sourceInput.identity) }
        target { eq('identity', targetInput.identity) }
      }
    }
    if (prSet)
    {
      def pr = prSet.get(0)
      sourceInput?.removeFromProfilesBlocked(pr)
      targetInput?.removeFromBlockedByProfiles(pr)
      pr.delete(flush: true)
    }
  }
}
