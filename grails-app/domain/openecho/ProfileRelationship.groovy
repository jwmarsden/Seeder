package openecho

class ProfileRelationship {

  static mapping = {
    discriminator column:"relationship_type"
  }

  Profile source
  Profile target

  Date dateCreated
  Date lastUpdated

  static constraints = {
    source(nullable: false)
    target(nullable: false)
  }

  String label() {
    "UNKNOWN"
  }

  String toString() {
    "${source.identity} -${this.label()}-> ${target.identity} (${id})"
  }
}
