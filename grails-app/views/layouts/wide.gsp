/*
Wide Layout
*/
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head>
    <title><g:layoutTitle default="Seeder" /></title>
    <link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
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
        <div style="float:left">
          <g:layoutBody />
        </div>
      </div>
      <div style="clear:both"></div>
    </div>
    <div id="foot">
      <div>
        <div class="block">
          <div>
            <h1>The Seeder Concept!</h1>
            <p>Behave as a Community and Grow Knowlege Together.</p>
            <p>Share your ideas, soultions and issues. With enough eyes all problems are shallow.</p>
          </div>
        </div>
        <div class="block">
          <div>
            <h1></h1>
          </div>
        </div>
        <div class="block last">
          <div>
            <h1>Contact!</h1>
            <p>For information contact @openecho on twitter.</p>
          </div>
        </div>
      </div>
    </div>
    </div>
  </body>
</html>