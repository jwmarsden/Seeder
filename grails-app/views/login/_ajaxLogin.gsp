<div id="loginDialog" class="login">
  <div id='login'>
    <div class='inner'>
      <!--<g:if test='${flash.message}'>
        <div class='login_message'>${flash.message}</div>
      </g:if>-->
      <div class='header'>Use your Seeder Account</div>
      <form action='${request.contextPath}/j_spring_security_check' method='POST' id='ajaxLoginForm' name='ajaxLoginForm' class='cssform'>
        <p>
          <label for='j_username'>Username</label>
          <input type='text' class='text_' name='j_username' id='j_username' value='${request.remoteUser}' />
        </p>
        <p>
          <label for='j_password'>Password</label>
          <input type='password' class='text_' name='j_password' id='j_password' />
        </p>
        <p>
          <label for='remember_me'>Remember me</label>
          <input type='checkbox' class='chk' name='_spring_security_remember_me' id='remember_me'
        <g:if test='${hasCookie}'>checked='checked'</g:if> />
        </p>
        <p class="buttons">
          <a href='javascript:void(0)' onclick='authAjax(); return false;'>Login</a>
        </p>
      </form>
    </div>
    <div class='inner'>
      <div class='header'>Use your OpenID</div>
      <p>Comming Soon</p>
      <form action='${postUrl}' method='POST' id='loginForm' class='cssform' style="display:none">
        <p>
          <label for='j_username'>OpenID</label>
          <input type='text' class='text_' name='j_username' />
        </p>
        <p>
          <input type='submit' value='Login' />
        </p>
      </form>
    </div>
  </div>
</div>

<script type='text/javascript'>

function onSuccessfulLogin() {

}

function authAjax() {
   //Element.update('loginMessage', 'Sending request ...');
   //Element.show('loginMessage');

   var ajaxLoginForm = $("#ajaxLoginForm");
   var formAction = ajaxLoginForm[0].action;
   var ajaxLoginParams = ajaxLoginForm.serialize() + '&spring-security-redirect=/login/ajaxSuccess';
   $.log($.stringFormat('Form action:\'{0}\' params:\'{1}\'', [formAction, ajaxLoginParams]));
   $.ajax({
      type: 'POST',
      url: formAction,
      data: ajaxLoginParams,
      success: function(response) {
        $.log($.stringFormat('Ajax Response:\'{0}\'',[response]));
        var responseJSON = jQuery.parseJSON(response);
        if(responseJSON.success) {
          $.log("Success")
        } else {
          $.log("Error")
        }
      }
    });
}
</script>