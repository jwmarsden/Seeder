<ul id="navbar" class="topnav shaded" style="float:right">
  <li id="navbarHome"><g:link controller="user" action="register" class="register">${message(code: 'seeder.button.register.label')}</g:link></li>
  <li id="navbarGo"><span class="go">${message(code: 'seeder.button.go.label')}</span>
    <div class="subnav">
      <ul>
        <g:each var="c" in="${grailsApplication.controllerClasses}">
        <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
        </g:each>
      </ul>
    </div>
  </li>
  <li id="search"><input type="text" class="search"/>
    <div class="subnav">
      Submit Button
    </div>
  </li>
  <li id="navbarLogin"><span class="login">${message(code: 'seeder.button.login.label')}</span></li>
</ul>
<jq:jquery>
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
    var navbarSet = $("#navbar > li");
    $.log($.stringFormat("Hover over {0}", [element]), 10);

    /*      for(i=0;i < navbarSet.size();i++) {
    var navbar = navbarSet.get(i);
    if(element != navbar && navbar.helper && navbar.getStatus()) {
    navbar.helper.hide($(navbar.helper.subElement), $(navbar));
    navbar.helper.show($(navbar.helper.subElement), $(navbar));
    } else {
    navbar.helper.hide($(navbar.helper.subElement), $(navbar));
    }
    }*/
  },
  onClick: function(element) {
    // If Register or dashbord then follow link
    //
    // If Menu Open then Close It

    // If Menu Closed then open it
  },
  goMenuHelper: {
    show: function(element, parentElement) {
      element.slideDown(150).show();
      parentElement.addClass("navbar_selected");
      navbar.setStatus(1);
    },
    hide: function(element, parentElement) {
      element.hide();
      if(parentElement) {
        parentElement.removeClass("navbar_selected");
      }
      navbar.setStatus(0);
    },
    toggle: function(element, parentElement) {
      if(!navbar.getStatus()) {
       navbar.goMenuHelper.show(element, parentElement);
      } else {
       navbar.goMenuHelper.hide(element, parentElement);
      }
    },
    closeCheck: function(element, parentElement) {
      if(navbar.goMenuHelper.status) {
        navbar.goMenuHelper.hide(element, parentElement);
      }
    }
  },
  loginDialogHelper: {
    getStatus: function() {
      return navbar.loginDialogHelper.status;
    },
    show: function(element, parentElement) {
      var leftPos =  parentElement.position().left - element.width() + parentElement.width()+8;
      var topPos = parentElement.parent().position().top + parentElement.parent().height();
      element.css('left', leftPos);
      element.css('top', topPos);
      element.slideDown(150).show();
      parentElement.addClass("navbar_selected");
      navbar.setStatus(1);
    },
    hide: function(element, parentElement) {
      element.hide();
      if(parentElement) {
        parentElement.removeClass("navbar_selected");
      }
      navbar.setStatus(0);
    },
    toggle: function(element, parentElement) {
      if(!navbar.getStatus()) {
        navbar.loginDialogHelper.show(element, parentElement);
      } else {
        navbar.loginDialogHelper.hide(element, parentElement);
      }
    },
    closeCheck: function(element, parentElement) {
      if(navbar.loginDialogHelper.status) {
        navbar.loginDialogHelper.hide(element, parentElement);
      }
    }
  }
}


$(document).ready(function() {
  /************************************
  ** Register Objects
  ************************************/
  // Navbar Go
  var navbarGoSubmenuSelector = "#navbarGo .subnav";
  var navbarGoSelector = "#navbarGo";
  $(navbarGoSelector).each(function() {this.helper=navbar.goMenuHelper;navbar.goMenuHelper.subElement=this});
  $(navbarGoSubmenuSelector).each(function() {this.helper=navbar.goMenuHelper;navbar.goMenuHelper.subElement=this});
  // Navbar Search

  // Navbar Login
  var navbarLoginSelector = "#navbarLogin";
  var loginDialogSelector = "#loginDialog";
  $(navbarLoginSelector).each(function() {this.helper=navbar.loginDialogHelper;navbar.loginDialogHelper.subElement=this});
  $(loginDialogSelector).each(function() {this.helper=navbar.loginDialogHelper;navbar.loginDialogHelper.subElement=this});

  /************************************
  ** Main Navbar
  ************************************/
  $("#navbar > li").hover(
    function () {
      $(this).addClass("hover");
      navbar.onButtonHover($(this)[0]);
    },
    function () {
      $(this).removeClass("hover");
    });

  /************************************
  ** Go Menu Handler
  ************************************/
  $(navbarGoSelector).click(function(event) {
    $(navbarGoSubmenuSelector).each(function() {this.helper.toggle($(this),$(this).parent())});
  });
  /************************************
  ** Login Dialog Handler
  ************************************/

  $(navbarLoginSelector).click(function() {
    $(loginDialogSelector).each(function() {this.helper.toggle($(this),$(navbarLoginSelector))});
  });
});

</jq:jquery>