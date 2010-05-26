package openecho

class ProfileRelationship {

  Profile source
  Profile target

  Date dateCreated
  Date lastUpdated

  static constraints = {
  }

  String toString() {
    "${source.identity} -> ${target.identity} (${id})"
  }

  static ProfileRelationship relate(source, target) {
    def pr = ProfileRelationship.findBySourceAndTarget(source, target)
    if (!pr)
    {
      pr = new ProfileRelationship(source: source, target: target)
      source?.addToProfilesFollowing(pr)
      target?.addToFollowerProfiles(pr)
      pr.save()
    }
    return pr
  }

  static void unRelate(source, target) {
    def pr = ProfileRelationship.findBySourceAndTarget(source, target)
    if (pr)
    {
      source?.removeFromProfilesFollowing(pr)
      target?.removeFromFollowerProfiles(pr)
      pr.delete()
    }
  }
}
