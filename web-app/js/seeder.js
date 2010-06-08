var logLevel = 10;

jQuery.stringFormat = function(format, arguments) {
    var str = format;
    for (var i = 0; i < arguments.length; i++) {
        str = str.replace('{' + i + '}', arguments[i]);
    }
    return str;
};
jQuery.log = function(message,level) {
    if(window.console != undefined) {
        if(!level || (level <= logLevel)) {
            console.debug(message);
        }
    } else { /* Stupid IE - get firebug lite and this will work. */ }
};
