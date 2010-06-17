<ul id="navbar">
  <li id="navbarHome" class="topnav"><g:link controller="user" action="register" class="register">${message(code: 'seeder.button.register.label')}</g:link></li>

  <li id="navbarGo" class="topnav"><span class="go">${message(code: 'seeder.button.go.label')}</span>
    <div class="subnav">
      <ul>
        <g:each var="c" in="${grailsApplication.controllerClasses}">
        <li class="option controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
        </g:each>
      </ul>
    </div>
  </li>

  <li id="navbarSearch" class="topnav"><span class="search"><input type="text" /></span>
    <div class="subnav">
      Search Options Coming!
    </div>
  </li>

  <li id="navbarLogin" class="topnav"><span class="login">${message(code: 'seeder.button.login.label')}</span>
      <div class="subnav">
        <div id='login'>
          <div class='inner'>
            <!--<g:if test='${flash.message}'>
              <div class='login_message'>${flash.message}</div>
            </g:if>-->

            <form action='${request.contextPath}/j_spring_security_check' method='POST' id='ajaxLoginForm' name='ajaxLoginForm' class='slim loginForm'>
              <fieldset class="userInformation rc">
                <legend>Seeder Account!</legend>
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
                <div class="buttons">
                  <span class="button"><button id="ajaxLogin" class="submit" type="submit">Login!</button></span>
                </div>
              </fieldset>
            </form>
            
          </div>
          <div class='inner'>
            <div class='header'>OpenID</div>
            <p>Comming Soon</p>
            <form action='${postUrl}' method='POST' id='loginForm' class='loginForm' style="display:none">
              <p>
                <label for='j_username'>OpenID</label>
                <input type='text' class='text_' name='j_username' />
              </p>
              <p>
                <input type='submit' value='Login' />
              </p>
            </form>
          </div>
          <div class="details">
            Logged In.
          </div>
        </div>
      </div>
  </li>
</ul>
<div id="navbarOverlay"></div>
<script type='text/javascript'>
var navbar = {
  status: 0,
  setStatus: function(newStatus) {
    if(!isNaN(newStatus)) {
      navbar.status = newStatus;
    } else {
      throw($.stringFormat('Cannot Set Status \'{0}\'', [newStatus]));
    }
  },
  getStatus: function() {
    return navbar.status;
  },
  onHover: function(element) {
    $.log($.stringFormat('Hover Detected: {0}: {1}',[element['id'], element]),10);
    if(element) {
      $(element).addClass("hover");
      if(navbar.getStatus()) {
        var navbarSet = $("#navbar > li");
        for(var i=0;i < navbarSet.size();i++) {
          var tempElement = navbarSet.get(i);
          if(element  == tempElement) {
            $.log($.stringFormat('Open Menu: {0}',[element['id']]),10);
            if(element.helper && element.helper.subElement) {
              element.helper.show(element.helper.subElement);
            }
          } else if(tempElement.helper && tempElement.helper.subElement) {
            tempElement.helper.hide(tempElement.helper.subElement);
          }
        }
      }
    }
  },
  onUnHover: function(element) {
    $.log($.stringFormat('UnHover Detected: {0}',[element['id']]),10);
    $(element).removeClass("hover");
  },
  onClick: function(element) {
    $.log($.stringFormat('Click Detected: {0}',[element['id']]),10);
    var subNav = $(element).children(".subnav");
    if(subNav) {
      if(!navbar.getStatus()) {
        $.log($.stringFormat('Open Submenu: {0}',[element['id']]),10);
        navbar.setStatus(1);
        if(navbarOverlay) {
          navbarOverlay.show();
        }
        if(element.helper && element.helper.subElement) {
          element.helper.show(element.helper.subElement);
        }
      } else {
        $.log($.stringFormat('Close Submenu: {0}',[element['id']]),10);
        navbar.setStatus(0);
        if(navbarOverlay) {
          navbarOverlay.hide();
        }
        if(element.helper && element.helper.subElement) {
          element.helper.hide(element.helper.subElement);
        }
      }
    }
  },
  close: function() {
    var navbarSet = $("#navbar > li");
    for(var i=0;i < navbarSet.size();i++) {
      var tempElement = navbarSet.get(i);
      if(tempElement.helper && tempElement.helper.subElement) {
        tempElement.helper.hide(tempElement.helper.subElement);
      }
    }
    navbar.setStatus(0);
  },
  goMenuHelper: {
    show: function(element) {
      $.log($.stringFormat('Show Element: {0}',[element['id']]),10); 
      $(element).fadeIn().show();
      if(element.helper.element) {
        $(element.helper.element).addClass("navbar_selected");
      }
    },
    hide: function(element) {
      $(element).hide();
      if(element.helper.element) {
        $(element.helper.element).removeClass("navbar_selected");
      }
    }
  },
  searchMenuHelper: {
    show: function(element) {
      $.log($.stringFormat('Show Element: {0}',[element['id']]),10);
      
      $(element).fadeIn().show();
      if(element.helper.element) {
        $(element.helper.element).addClass("navbar_selected");
      }
    },
    hide: function(element) {
      $(element).hide();
      if(element.helper.element) {
        $(element.helper.element).removeClass("navbar_selected");
      }
    }
  },
  loginMenuHelper: {
    show: function(element) {
      //var leftPos = parentElement.position().left - element.width() + parentElement.width()+8;
      //var topPos = parentElement.parent().position().top + parentElement.parent().height();
      //element.css('left', leftPos);
      ///element.css('top', topPos);
      $(element).fadeIn().show();
      if(element.helper.element) {
        $(element.helper.element).addClass("navbar_selected");
      }
    },
    hide: function(element, parentElement) {
      $(element).hide();
      if(element.helper.element) {
        $(element.helper.element).removeClass("navbar_selected");
      }
    }
  }
}
var navbarOverlay = {
    status:0,
    show: function() {
      var viewportwidth;
      var viewportheight;

      // the more standards compliant browsers (mozilla/netscape/opera/IE7) use window.innerWidth and window.innerHeight

      if (typeof window.innerWidth != 'undefined')
      {
          viewportwidth = window.innerWidth,
          viewportheight = window.innerHeight
      }

      // IE6 in standards compliant mode (i.e. with a valid doctype as the first line in the document)

      else if (typeof document.documentElement != 'undefined'
         && typeof document.documentElement.clientWidth !=
         'undefined' && document.documentElement.clientWidth != 0)
      {
           viewportwidth = document.documentElement.clientWidth,
           viewportheight = document.documentElement.clientHeight
      }

      // older versions of IE

      else
      {
           viewportwidth = document.getElementsByTagName('body')[0].clientWidth,
           viewportheight = document.getElementsByTagName('body')[0].clientHeight
      }
      $("#navbarOverlay").width(viewportwidth).height(viewportheight).show();
    },
    hide: function() {
      $("#navbarOverlay").hide();
    }
}
</script>

<jq:jquery>
$(document).ready(function() {
  /************************************
  ** Register Objects
  ************************************/
  // Navbar Home

  // Navbar Go
  var navbarGoSubmenuSelector = "#navbarGo .subnav";
  var navbarGoSelector = "#navbarGo";
  $(navbarGoSelector).each(function() {this.helper=navbar.goMenuHelper;navbar.goMenuHelper.element=this});
  $(navbarGoSubmenuSelector).each(function() {this.helper=navbar.goMenuHelper;navbar.goMenuHelper.subElement=this});

  // Navbar Search
  var navbarSearchSubmenuSelector = "#navbarSearch .subnav";
  var navbarSearchSelector = "#navbarSearch";
  $(navbarSearchSelector).each(function() {this.helper=navbar.searchMenuHelper;navbar.searchMenuHelper.element=this});
  $(navbarSearchSubmenuSelector).each(function() {this.helper=navbar.searchMenuHelper;navbar.searchMenuHelper.subElement=this});

  // Navbar Login
  var navbarLoginSubmenuSelector = "#navbarLogin .subnav";
  var navbarLoginSelector = "#navbarLogin";
  $(navbarLoginSelector).each(function() {this.helper=navbar.loginMenuHelper;navbar.loginMenuHelper.element=this});
  $(navbarLoginSubmenuSelector).each(function() {this.helper=navbar.loginMenuHelper;navbar.loginMenuHelper.subElement=this});

  /************************************
  ** Main Navbar Events
  ************************************/
  $("#navbar li.topnav").children(":first-child").hover(
    function () {
      navbar.onHover($(this).parent().get(0));
    },
    function () {
      navbar.onUnHover($(this).parent().get(0));
    });

    $("#navbar li.topnav").children(":first-child").click(
    function() {
      navbar.onClick($(this).parent().get(0));
    });

  /************************************
  ** Main Sub Navbar Events
  ************************************/
  $("#navbar .option").hover(
    function () {
      $(this).addClass("hoverOption");
    },
    function () {
      $(this).removeClass("hoverOption");
    });

  /************************************
  ** Navbar Overlay Events
  ************************************/
    $("#navbarOverlay").click(
    function() {
      navbar.close();
      navbarOverlay.hide();
    });

});

</jq:jquery>