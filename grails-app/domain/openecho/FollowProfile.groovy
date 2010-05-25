package openecho

class FollowProfile {

  static belongsTo = [following : Profile, follower : Profile]

  static constraints = {
  }

  String toString() {
    "${follower} -> ${following} (${id})"
  }
}
