package openecho

class ProfileRelationship {

  enum Type {
    FOLLOW, FRIEND, BLOCKED
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
    "${source.identity} -${type}- ${target.identity} (${id})"
  }

  static ProfileRelationship relate(source, target, type) {
    def pr = ProfileRelationship.findBySourceAndTarget(source, target, type)
    if (!pr)
    {
      pr = new ProfileRelationship(source: source, target: target, type: type)
      if(type == Type.FOLLOW) {
        source?.addToProfilesFollowing(pr)
        target?.addToFollowerProfiles(pr)
      }
      pr.save()
    }
    return pr
  }

  static void unRelate(source, target, type) {
    def pr = ProfileRelationship.findBySourceAndTarget(source, target, type)
    if (pr)
    {
      if(type == Type.FOLLOW) {
        source?.removeFromProfilesFollowing(pr)
        target?.removeFromFollowerProfiles(pr)
      }
      pr.delete()
    }
  }
}
