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
      $(navbarGoSelector).each(function() {this.helper=navbar.goMenuHelper;navbar.goMenuHelper.subElement=this});
      $(navbarGoSubmenuSelector).each(function() {this.helper=navbar.goMenuHelper;navbar.goMenuHelper.subElement=this});
      $(navbarGoSelector).click(function(event) {
        $(navbarGoSubmenuSelector).each(function() {this.helper.toggle($(this),$(this).parent())});
      });
      /************************************
      ** Login Dialog Handler
      ************************************/
      var navbarLoginSelector = "#navbarLogin";
      var loginDialogSelector = "#loginDialog";
      $(navbarLoginSelector).each(function() {this.helper=navbar.loginDialogHelper;navbar.loginDialogHelper.subElement=this});
      $(loginDialogSelector).each(function() {this.helper=navbar.loginDialogHelper;navbar.loginDialogHelper.subElement=this});
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
  <g:render template='/element/navbar'/>
  <div style="clear:both;">
    <g:layoutBody />
  </div>
</div>
<div id="dialog" title="Dialog Title" style="display:none">I'm in a dialog</div>
<g:render template='/element/overlay'/>
</body>
</html>