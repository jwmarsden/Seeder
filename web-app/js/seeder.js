var logLevel = 0;

jQuery.stringFormat = function(format, arguments) {
    var str = format;
    for (i = 0; i < arguments.length; i++) {
        str = str.replace('{' + i + '}', arguments[i]);
    }
    return str;
};
jQuery.log = function(message,level) {
    if(console) {
        console.debug(message);
    } else {
        // Stupid IE
    }
};


function checkForNavbarClose(elementSet) {
    //$.log($.stringFormat('Close check for \'{0}\'', [elementSet[0].id]));
    //$.log(elementSet);
    var element = elementSet[0];
    var navbarSet = $("#navbar > li");
    for(i=0;i < navbarSet.size();i++) {
        var navbar = navbarSet.get(i);
        if(element != navbar && navbar.helper) {

            navbar.helper.hide($(navbar.helper.subElement), $(navbar));
        }
    }
}

var goMenuHelper = {
    status: 0,
    setStatus: function(newStatus) {
        if(!isNaN(newStatus)) {
            goMenuHelper.status = newStatus;
        } else {
            throw($.stringFormat('Cannot Set Status \'{0}\'', [newStatus]));
        }
    },
    getStatus: function() {
        return goMenuHelper.status;
    },
    show: function(element, parentElement) {
        element.slideDown(150).show();
        parentElement.addClass("navbar_selected");
        goMenuHelper.setStatus(1);
    },
    hide: function(element, parentElement) {
        element.hide();
        if(parentElement) {
            parentElement.removeClass("navbar_selected");
        }
        goMenuHelper.setStatus(0);
    },
    toggle: function(element, parentElement) {
       if(!goMenuHelper.status) {
           goMenuHelper.show(element, parentElement);
       } else {
           goMenuHelper.hide(element, parentElement);
       }
    },
    closeCheck: function(element, parentElement) {
        if(goMenuHelper.status) {
            goMenuHelper.hide(element, parentElement);
        }
    }
}

var loginDialogHelper = {
    status: 0,
    setStatus: function(newStatus) {
        if(!isNaN(newStatus)) {
            loginDialogHelper.status = newStatus;
        } else {
            throw($.stringFormat('Cannot Set Dialog Status \'{0}\'', [newStatus]));
        }
    },
    getStatus: function() {
        return loginDialogHelper.status;
    },
    show: function(element, parentElement) {
        var leftPos =  parentElement.position().left - element.width() + parentElement.width()+8;
        var topPos = parentElement.parent().position().top + parentElement.parent().height();
        element.css('left', leftPos);
        element.css('top', topPos);
        element.slideDown(150).show();
        parentElement.addClass("navbar_selected");
        loginDialogHelper.setStatus(1);
    },
    hide: function(element, parentElement) {
        element.hide();
        if(parentElement) {
            parentElement.removeClass("navbar_selected");
        }
        loginDialogHelper.setStatus(0);
    },
    toggle: function(element, parentElement) {
       if(!loginDialogHelper.status) {
           loginDialogHelper.show(element, parentElement);
       } else {
           loginDialogHelper.hide(element, parentElement);
       }
    },
    closeCheck: function(element, parentElement) {
        if(loginDialogHelper.status) {
            loginDialogHelper.hide(element, parentElement);
        }
    }
}
