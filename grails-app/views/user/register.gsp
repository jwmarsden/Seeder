<html>
  <head>
    <meta name="layout" content="default" />
    <title>Register a new User</title>
  </head>
  <body>
    <h1>${message(code: 'seeder.heading.register')}</h1>
    <div class="register" style="width:600px">
      <div class="info"><g:message code="seeder.message.register" /></div>
      <content tag="test">
        Test Text
      </content>
      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:form action="register" class="form rc">
        <div>
        <fieldset class="userInformation rc">
          <legend>Login Details</legend>
            <g:hasErrors bean="${person}">
              <div class="errors" style="margin-bottom:5px">
                <g:renderErrors bean="${person}" as="list" />
              </div>
            </g:hasErrors>
            <recaptcha:ifFailed>
              <div class="errors" style="margin-bottom:5px">
                <ul>
                  <li>There was an error with the two words entered into the captcha. Please try again.</li>
                </ul>
              </div>
            </recaptcha:ifFailed>
          
          <div class ="${hasErrors(bean:person,field:'username','error')}"> 
                  <label for="username">User Name</label><input type="text" id="username" name="username" value="${person.username?.encodeAsHTML()}"/>
          </div> 
          <div class ="${hasErrors(bean:person,field:'passwd','error')}">
                  <label for="password">Password</label><input type="password" id="pass" name="pass" value="${person.pass?.encodeAsHTML()}"/>
          </div> 
          <div class ="${hasErrors(bean:person,field:'passwd','error')}">
                  <label for="passVerify">Retype Password</label><input type="password" id="passVerify" name="passVerify" value="${person.passVerify?.encodeAsHTML()}"/>
          </div>
          <div class ="${hasErrors(bean:person,field:'email','error')}"> 
                  <label for="password2">Email Address</label><input type="text" id="email" name="email" value="${person.email?.encodeAsHTML()}"/>
          </div>
          <div class="captcha">
            <label for="captcha">Captcha Check</label>
            <recaptcha:ifEnabled>
              <recaptcha:recaptcha theme="white"/>
            </recaptcha:ifEnabled>
          </div>
          <div class="clear"></div>
          <div class="buttons">
            <span class="button"><button id="submitRegistration" class="submit" type="submit">Create My Account!</button></span>
          </div>
        </fieldset>
        </div>
      </g:form>

    </div>
  </body>
</html>
