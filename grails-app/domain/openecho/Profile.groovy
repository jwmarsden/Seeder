package openecho

class Profile {

  static hasMany = [ users : User, profilesFollowing : ProfileRelationship, followerProfiles : ProfileRelationship ]
  static mappedBy = [ profilesFollowing : "source", followerProfiles : "target"]

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
    ProfileRelationship.relate(this, profile)
    following()
  }

  List removeFromFollowing(Profile profile) {
    ProfileRelationship.unRelate(this, profile)
    following()
  }
}
