<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <meta name="layout" content="main" />
    <title>Sample title</title>
  </head>
  <body>
    <h1>${message(code: 'seeder.heading.register')}</h1>
    <div class="register" style="width:600px">
      <div class="info"><g:message code="seeder.message.register" /></div>

      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${person}">
        <div class="errors">
          <g:renderErrors bean="${person}" as="list" />
        </div>
      </g:hasErrors>

      <g:form action="register" class="form rc">
        <div>
        <fieldset class="userInformation rc">
          <legend>Login Details</legend> 
          <div class ="${hasErrors(bean:person,field:'username','errors')}"> 
                  <label for="username">User Name</label><input type="text" id="username" name="username" value="${person.username?.encodeAsHTML()}"/>
          </div> 
          <div class ="${hasErrors(bean:person,field:'username','errors')}"> 
                  <label for="password">Password</label><input type="password" id="passwd" name="passwd" value="${person.passwd?.encodeAsHTML()}"/>
          </div> 
          <div class ="${hasErrors(bean:person,field:'username','errors')}"> 
                  <label for="password2">Retype Password</label><input type="password" id="passwd2" name="passwd2" value="${person.passwd?.encodeAsHTML()}"/>
          </div>
          <div class ="${hasErrors(bean:person,field:'email','errors')}"> 
                  <label for="password2">Email Address</label><input type="text" id="email" name="email" value="${person.email?.encodeAsHTML()}"/>
          </div>
          <div class="captcha">
            <label for="captcha">Captcha Check</label>
            <recaptcha:ifEnabled>
              <recaptcha:ifFailed>
                <div class="error">There Was An Error. Please Enter The Correct Words.</div>
              </recaptcha:ifFailed>
              <recaptcha:recaptcha theme="white"/>
            </recaptcha:ifEnabled>
          </div>
        <div class="buttons">
          <span class="button"><button class="submit" type="submit">Create My Account!</button></span>
        </div>
        </fieldset>
        </div>
      </g:form>

    </div>
  </body>
</html>
