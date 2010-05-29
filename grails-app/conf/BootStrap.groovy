class BootStrap {

     def init = { servletContext ->
       new openecho.Profile(identity:"openecho",firstName:"John",lastName:"Marsden",name:"John Marsden").save()
     }
     def destroy = {
     }
} 