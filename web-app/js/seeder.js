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