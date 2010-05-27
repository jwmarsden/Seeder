package openecho

class ProfileRelationship {

  enum Type {
    FOLLOW, BLOCKED
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

  static ProfileRelationship relate(source, target, type) {
    def pr = ProfileRelationship.findBySourceAndTarget(source, target)
    if (!pr)
    {
      pr = new ProfileRelationship(source: source, target: target, type: type)
      if(type == Type.FOLLOW) {
        source?.addToProfilesFollowing(pr)
        target?.addToFollowerProfiles(pr)
      } else if(type == Type.BLOCKED) {
        source?.addToProfilesBlocked(pr)
        target?.addToBlockedByProfiles(pr)
      }
      pr.save()
    }
    return pr
  }

  static void unRelate(source, target, type) {
    def pr = ProfileRelationship.findBySourceAndTarget(source, target)
    if (pr)
    {
      if(type == Type.FOLLOW) {
        source?.removeFromProfilesFollowing(pr)
        target?.removeFromFollowerProfiles(pr)
      } else if(type == Type.BLOCKED) {
        source?.removeFromProfilesBlocked(pr)
        target?.removeFromBlockedByProfiles(pr)
      }
      pr.delete()
    }
  }
}
