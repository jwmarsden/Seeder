package openecho

class Profile {

  static hasMany = [
          users : User,
          profilesFollowing : ProfileFollowRelationship,
          followerProfiles : ProfileFollowRelationship,
          profilesBlocked: ProfileBlockedRelationship,
          blockedByProfiles: ProfileBlockedRelationship,
          profilesFriended: ProfileFriendRelationship
  ]
  static mappedBy = [
          profilesFollowing : "source",
          followerProfiles : "target",
          profilesBlocked: "source",
          blockedByProfiles: "target",
          profilesFriended: "source",
  ]
  static mapping = {
    users lazy:false
  }

  String identity
  String firstName
  String lastName
  String name
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

  static transients = [ "displayName" ]

  static constraints = {
    identity(nullable: false, unique: true, maxSize: 50)
    firstName(nullable: true, maxSize: 50)
    lastName(nullable: true, maxSize: 50)
    name(nullable: true, maxSize: 100)
    birthDate(nullable: true)
    biography(nullable: true, maxSize: 1000)
    homepage(url: true, nullable: true)
    email(email: true, nullable: true)
    timezone(nullable: true)
    city(nullable: true)
    country(nullable: true)
    photo(nullable: true)
  }

  String getDisplayName() {
    if(this.displayName) {
      return this.displayName
    }
    if(name) {
      return String.format("%s (%s)", name, identity)
    } else {
      return identity
    }
  }

  void setDisplayName(String displayName) {
    this.displayName = displayName;
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
    ProfileFollowRelationship.relate(this, profile)
    following()
  }

  List removeFromFollowing(Profile profile) {
    ProfileFollowRelationship.unRelate(this, profile)
    following()
  }

  List blocked() {
    profilesBlocked.collect{it.source}
  }

  List blockedBy() {
    blockedByProfiles.collect{it.target}
  }

  List addToBlocking(Profile profile) {
    ProfileBlockedRelationship.relate(this, profile)
    blocked()
  }

  List removeFromBlocking(Profile profile) {
    ProfileBlockedRelationship.unRelate(this, profile)
    blockedBy()
  }

  List friends() {
    profilesFriended.collect{it.source}
  }

  List addToFriends(Profile profile) {
    ProfileFriendRelationship.relate(this, profile)
    ProfileFriendRelationship.relate(profile, this)
    friends()
  }

  List removeFromFriends(Profile profile) {
    ProfileFriendRelationship.unRelate(this, profile)
    ProfileFriendRelationship.unRelate(profile, this)
    friends()
  }
}
