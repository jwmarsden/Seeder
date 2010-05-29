package openecho

class ProfileFriendRelationship extends ProfileRelationship {

  static mapping = {
    discriminator value: "FRIEND"
  }

  String label() {
    "Friends"
  }

  static ProfileRelationship relate(sourceInput, targetInput) {
    def prSet = ProfileFriendRelationship.createCriteria().list {
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
      pr = new ProfileFriendRelationship(source: sourceInput, target: targetInput)
      sourceInput?.addToProfilesFriended(pr);
    }
    return pr
  }

  static void unRelate(sourceInput, targetInput) {
    def prSet = ProfileFriendRelationship.createCriteria().list {
      and {
        source { eq('identity', sourceInput.identity) }
        target { eq('identity', targetInput.identity) }
      }
    }
    if (prSet)
    {
      def pr = prSet.get(0)
      sourceInput?.removeFromProfilesFriended(pr)
      pr.delete(flush: true)
    }
  }
}
