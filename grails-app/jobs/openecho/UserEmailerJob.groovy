package openecho

import org.grails.mail.MailService

class UserEmailerJob {

    MailService mailService

    static triggers = {
        simple name: 'userEmailVerify', startDelay: 1000, repeatInterval: 60000
    }

    def execute() {
        log.debug "Enter UserEmailerJob.execute()"
        def users = User.findAllByRequiresVerificationEmail(true);
        users.each({ 
            log.error "Verification Email Required for: ${it}"
            String email = it?.email
            String senderEmail = "j.w.marsden@gmail.com"
            String emailSubject = "Email Verification Required!"
            String emailMessage = "An account was requested at Seeder using this email address. To complete this registration you must verify this email address. To do that simply click this link (or open it in a browser window).\r\n\r\n" +
                                      "http://localhost:8080/seeder.git/user/verify/${it.username}/${it.uuid} \r\n\r\n" +
                                      "If this account was not requested by you then simply ignore this email.\r\n\r\n" +
                                      "\r\n\r\n" +
                                      "The Seeder Management"
            try {
                mailService.sendMail {
                  to email
                  from senderEmail
                  subject emailSubject
                  body emailMessage
                }
                log.debug "Verification Email Sent To: ${it}"
                it.requiresVerificationEmail = false;
                if(!it.save()) {
                    log.error "Error Saving User After Email"
                }
            } catch(Error e) {
                log.error "Error Sending Email:" + e
            }
        });
    }
}
