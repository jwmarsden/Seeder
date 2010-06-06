<html>
<head>
  <title><g:layoutTitle default="Grails" /></title>
  <link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
  <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
  <link rel="stylesheet" href="${resource(dir:'css',file:'seeder.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:javascript library="jquery" />
  <g:javascript library="seeder" />
  <g:javascript library="application" />
  <jqui:resources />
  <g:layoutHead />
  <jq:jquery>

    $(document).ready(function() {
      /************************************
      ** Main Navbar
      ************************************/
      $("#navbar > li").hover(
      function () {
        $(this).addClass("hover");
        checkForNavbarClose($(this));
      },
      function () {
        $(this).removeClass("hover");
      });

      /************************************
      ** Go Menu Handler
        ************************************/
      var navbarGoSubmenuSelector = "#navbarGo .subnav";
      var navbarGoSelector = "#navbarGo";
      $(navbarGoSelector).each(function() {this.helper=goMenuHelper;goMenuHelper.subElement=this});
      $(navbarGoSubmenuSelector).each(function() {this.helper=goMenuHelper;goMenuHelper.subElement=this});
      $(navbarGoSelector).click(function(event) {
        $(navbarGoSubmenuSelector).each(function() {this.helper.toggle($(this),$(this).parent())});
      });
      /************************************
      ** Login Dialog Handler
      ************************************/
      var navbarLoginSelector = "#navbarLogin";
      var loginDialogSelector = "#loginDialog";
      $(navbarLoginSelector).each(function() {this.helper=loginDialogHelper;loginDialogHelper.subElement=this});
      $(loginDialogSelector).each(function() {this.helper=loginDialogHelper;loginDialogHelper.subElement=this});
      $(navbarLoginSelector).click(function() {
        $(loginDialogSelector).each(function() {this.helper.toggle($(this),$(navbarLoginSelector))});
      });


     
    });
  </jq:jquery>
</head>
<body>
  <g:render template='/login/ajaxLogin'/>
  
<div style="width: 800px; margin:0 auto">
  <div id="header" style="margin-bottom:10px; padding:0; float:left">
    <img src="<g:createLinkTo dir='images' file='seeder_logo.png'/>" alt="logo"/>
  </div>

  <ul id="navbar" class="topnav shaded" style="float:right">
    <li id="navbarHome"><g:link controller="user" action="register" class="register">${message(code: 'seeder.button.register.label')}</g:link></li>
    <li id="navbarGo"><span class="go">${message(code: 'seeder.button.go.label')}</span>
      <ul class="subnav">
        <g:each var="c" in="${grailsApplication.controllerClasses}">
          <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
        </g:each>
      </ul>
    </li>
    <li id="search"><input type="text" class="search"/></li>
    <li id="navbarLogin"><span class="login">${message(code: 'seeder.button.login.label')}</span></li>
  </ul>
  <div style="clear:both;">
    <g:layoutBody />
  </div>
</div>
<div id="dialog" title="Dialog Title" style="display:none">I'm in a dialog</div>
<g:render template='/element/overlay'/>
</body>
</html>