package openecho

class ProfileRelationship {

  static belongsTo = [ followerProfile : Profile ]

  Profile followingProfile

  static constraints = {
  }

  String toString() {
    "${following} (${id})"
  }
}
