<html>
<head>
  <title><g:layoutTitle default="Grails" /></title>
  <link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:javascript library="jquery"/>
  <g:layoutHead />
  <g:javascript library="application" />
</head>
<body>
<div style="width: 800px; margin:0 auto">
  <div id="header" style="margin:0; padding:0">
    <img src="<g:createLinkTo dir='images' file='seeder_logo.png'/>" alt="logo"/>
  </div>
  <g:layoutBody />
</div>
</body>
</html>