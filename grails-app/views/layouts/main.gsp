<html>
<head>
  <title><g:layoutTitle default="Seeder" /></title>
  <link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
  <!--<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />-->
  <link rel="stylesheet" href="${resource(dir:'css',file:'seeder.css')}" />
  <link rel="shortcut icon" href="${resource(dir:'images',file:'favicon.ico')}" type="image/x-icon" />
  <g:javascript library="jquery" />
  <g:javascript library="seeder" />
  <g:javascript library="application" />
  <jqui:resources />
  <g:layoutHead />
  <jq:jquery>
    $(document).ready(function() {
      
    });
  </jq:jquery>
</head>
<body> 
<div style="width: 800px; margin:0 auto">
  <div id="header" style="margin-bottom:10px; padding:0; float:left">
    <img src="<g:createLinkTo dir='images' file='seeder_logo.png'/>" alt="logo"/>
  </div>
  <g:render template='/element/navbar'/>
  <div style="clear:both;">
    <g:layoutBody />
  </div>
</div>
<g:render template='/element/overlay'/>
</body>
</html>