<head>
  <meta name='layout' content='default' />
  <title>Login</title>
</head>
<body>
      <div class="info"><g:message code="seeder.message.register" /></div>

      <form action='${postUrl}' method='POST' id='loginForm' class='form rc'>
        <div>
        <fieldset class="userInformation rc">
          <legend>Login Details</legend>
            <g:if test="${flash.message}">
              <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${person}">
              <div class="errors" style="margin-bottom:5px">
                <g:renderErrors bean="${person}" as="list" />
              </div>
            </g:hasErrors>
            <div>
              <label for='j_username'>Login ID</label><input type='text' class='text_' name='j_username' id='j_username' value='${request.remoteUser}' />
            </div>
            <div>
              <label for='j_password'>Password</label><input type='password' class='text_' name='j_password' id='j_password' />
            </div>
            <div>
              <label for='remember_me'>Remember me</label><input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'<g:if test='${hasCookie}'>checked='checked'</g:if> />
            </div>
          <div class="buttons">
            <span class="button"><button id="submitLogin" class="submit" type="submit">Login to my Account!</button></span>
          </div>
        </fieldset>
        </div>
      </form>
</body>
