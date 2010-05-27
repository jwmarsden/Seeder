package openecho

class Profile {

  static hasMany = [
          users : User,
          profilesFollowing : ProfileRelationship,
          followerProfiles : ProfileRelationship,
          profilesBlocked: ProfileRelationship,
          blockedByProfiles: ProfileRelationship,
          profilesFriended: ProfileRelationship,
//          friendByProfiles: ProfileRelationship
  ]
  static mappedBy = [
          profilesFollowing : "source",
          followerProfiles : "target",
          profilesBlocked: "source",
          blockedByProfiles: "target",
          profilesFriended: "source",
  //        friendByProfiles: "target"
  ]

  String identity
  String firstName
  String lastName
  String displayName
  Date birthDate
  String biography
  String homepage
  String email
  String timezone
  String city
  String country
  byte[] photo

  Date dateCreated
  Date lastUpdated

  static constraints = {
    identity(nullable: false, unique: true, maxSize: 150)
    firstName(nullable: true)
    lastName(nullable: true)
    displayName(nullable: true, maxSize: 150)
    birthDate(nullable: true)
    biography(nullable: true, maxSize: 1000)
    homepage(url: true, nullable: true)
    email(email: true, nullable: true)
    timezone(nullable: true)
    city(nullable: true)
    country(nullable: true)
    photo(nullable: true)
  }

  String toString() {
    "Profile for ${identity} (${id})"
  }

  List followedBy() {
    followerProfiles.collect{it.source}
  }

  List following() {
    profilesFollowing.collect{it.target}
  }

  List addToFollowing(Profile profile) {
    ProfileRelationship.relate(this, profile, ProfileRelationship.Type.FOLLOW)
    following()
  }

  List removeFromFollowing(Profile profile) {
    ProfileRelationship.unRelate(this, profile, ProfileRelationship.Type.FOLLOW)
    following()
  }

  List blocked() {
    profilesBlocked.collect{it.source}
  }

  List blockedBy() {
    blockedByProfiles.collect{it.target}
  }

  List addToBlocking(Profile profile) {
    ProfileRelationship.relate(this, profile, ProfileRelationship.Type.BLOCKED)
    blocked()
  }

  List removeFromBlocking(Profile profile) {
    ProfileRelationship.unRelate(this, profile, ProfileRelationship.Type.BLOCKED)
    blockedBy()
  }

  List friends() {
    profilesFriended.collect{it.source}
  }

  List addToFriends(Profile profile) {
    ProfileRelationship.relate(this, profile, ProfileRelationship.Type.FRIEND)
    ProfileRelationship.relate(profile, this, ProfileRelationship.Type.FRIEND)
    friends()
  }

  List removeFromFriends(Profile profile) {
    ProfileRelationship.unRelate(this, profile, ProfileRelationship.Type.FRIEND)
    ProfileRelationship.unRelate(profile, this, ProfileRelationship.Type.FRIEND)
    friends()
  }
}
