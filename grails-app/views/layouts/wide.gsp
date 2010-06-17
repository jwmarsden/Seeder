<%@ page contentType="text/html;charset=UTF-8" %>
/*
Wide Layout
*/
<html>
  <head>
    <title><g:layoutTitle default="Seeder" /></title>
    <g:render template='/element/headCommon'/>
  </head>
  <body>
    <div style="width:1000px; margin:0 auto">
      <g:render template='/element/header'/>
      <g:render template='/element/navbar'/>

      <div style="clear:both;">
        <div style="float:left">
          <g:layoutBody />
        </div>
      </div>
      <div style="clear:both"></div>
    </div>

    <g:render template='/element/footer'/>
  </body>
</html>