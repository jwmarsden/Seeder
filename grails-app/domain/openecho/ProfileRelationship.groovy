package openecho

class ProfileRelationship {

  enum Type {
    FOLLOW, BLOCKED, FRIEND
  }

  Profile source
  Profile target
  Type type

  Date dateCreated
  Date lastUpdated

  static constraints = {
    source(nullable: false)
    target(nullable: false)
    type(nullable: false)
  }

  String toString() {
    "${source.identity} -${type}-> ${target.identity} (${id})"
  }

  static ProfileRelationship relate(sourceInput, targetInput, typeInput) {
    // TODO: This also needs to query by type.
    def pr = ProfileRelationship.findBySourceAndTarget(sourceInput, targetInput)
    if (!pr)
    {
      pr = new ProfileRelationship(source: sourceInput, target: targetInput, type: typeInput)
      if(typeInput == Type.FOLLOW) {
        sourceInput?.addToProfilesFollowing(pr)
        targetInput?.addToFollowerProfiles(pr)
      } else if(typeInput == Type.BLOCKED) {
        sourceInput?.addToProfilesBlocked(pr)
        targetInput?.addToBlockedByProfiles(pr)
      } else if (typeInput == Type.FRIEND) {
        sourceInput?.addToProfilesFriended(pr)
      }
    }
    return pr
  }

  static void unRelate(sourceInput, targetInput, typeInput) {
    // TODO: This also needs to query by type.
    def pr = ProfileRelationship.findBySourceAndTarget(sourceInput, targetInput)
    if (pr)
    {
      if(typeInput == Type.FOLLOW) {
        sourceInput?.removeFromProfilesFollowing(pr)
        targetInput?.removeFromFollowerProfiles(pr)
      } else if(typeInput == Type.BLOCKED) {
        sourceInput?.removeFromProfilesBlocked(pr)
        targetInput?.removeFromBlockedByProfiles(pr)
      } else if (typeInput == Type.FRIEND) {
        sourceInput?.removeFromProfilesFriended(pr)
      }
      pr.delete(flush: true)
    }
  }
}
