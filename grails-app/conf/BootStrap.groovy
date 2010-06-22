class BootStrap {
    def authenticateService
    
    def init = { servletContext ->
        // Create Roles
        def everyoneRole = new openecho.Role(authority:"ROLE_USER", description:"Role for Users").save()
        def administratorRole = new openecho.Role(authority:"ROLE_ADMIN", description:"Role for Administrators").save()
        // Create Users
        def jmarsdenUser = new openecho.User(username: "jmarsden", passwd: authenticateService.encodePassword("rah"), email: "j.w.marsden@gmail.com", enabled: true)
        jmarsdenUser.addToAuthorities(everyoneRole).addToAuthorities(administratorRole).save()
        // Create Profiles
        def openechoProfile = new openecho.Profile(identity:"openecho",firstName:"John",lastName:"Marsden",name:"John Marsden",biography:"##Openecho! :-)\n\nPlay Profile").save()
        def jmarsdenProfile = new openecho.Profile(identity:"jmarsden",firstName:"John",lastName:"Marsden",name:"John Marsden",biography:"##Openecho! >:-0\n\nSerious Profile\n\nThis is a block of text that I want to be long enough to cause at least a single line wrap. This sentence will have a link in it right about [here](http://github.com/openecho) and when you click on it you will be taken to my github profile. Really its not that interesting, but this seems to be common with test text and the like.").save()
        jmarsdenUser.addToProfiles(openechoProfile).addToProfiles(jmarsdenProfile).save()
    }
    def destroy = {
    }
} 