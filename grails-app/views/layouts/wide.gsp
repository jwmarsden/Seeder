<%@ page contentType="text/html;charset=UTF-8" %>
<%
/**
Wide Layout
**/
%>
<html>
  <head>
    <title><g:layoutTitle default="Seeder" /></title>
    <g:render template='/layouts/headCommon'/>
  </head>
  <body>
    <div style="width:1000px; margin:0 auto">
      <g:render template='/layouts/header'/>
      <g:render template='/layouts/navbar'/>

      <div style="clear:both;">
        <div style="float:left">
          <g:layoutBody />
        </div>
      </div>
      <div style="clear:both"></div>
      <g:render template='/layouts/footer'/>
    </div>
  </body>
</html>