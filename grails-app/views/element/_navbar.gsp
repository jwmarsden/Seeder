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
<script type='text/javascript'>
var navbar = {
    status: 0,
    hoverButton: function(elementSet) {
        var element = elementSet[0];
        var navbarSet = $("#navbar > li");
        for(i=0;i < navbarSet.size();i++) {
            var navbar = navbarSet.get(i);
            if(element != navbar && navbar.helper) {
                navbar.helper.hide($(navbar.helper.subElement), $(navbar));
            }
        }
    },
    goMenuHelper: {
        status: 0,
        setStatus: function(newStatus) {
            if(!isNaN(newStatus)) {
                navbar.goMenuHelper.status = newStatus;
            } else {
                throw($.stringFormat('Cannot Set Status \'{0}\'', [newStatus]));
            }
        },
        getStatus: function() {
            return navbar.goMenuHelper.status;
        },
        show: function(element, parentElement) {
            element.slideDown(150).show();
            parentElement.addClass("navbar_selected");
            navbar.goMenuHelper.setStatus(1);
        },
        hide: function(element, parentElement) {
            element.hide();
            if(parentElement) {
                parentElement.removeClass("navbar_selected");
            }
            navbar.goMenuHelper.setStatus(0);
        },
        toggle: function(element, parentElement) {
           if(!navbar.goMenuHelper.status) {
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
        status: 0,
        setStatus: function(newStatus) {
            if(!isNaN(newStatus)) {
                navbar.loginDialogHelper.status = newStatus;
            } else {
                throw($.stringFormat('Cannot Set Dialog Status \'{0}\'', [newStatus]));
            }
        },
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
            navbar.loginDialogHelper.setStatus(1);
        },
        hide: function(element, parentElement) {
            element.hide();
            if(parentElement) {
                parentElement.removeClass("navbar_selected");
            }
            navbar.loginDialogHelper.setStatus(0);
        },
        toggle: function(element, parentElement) {
           if(!navbar.loginDialogHelper.status) {
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
</script>