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
        <div style="float:left;width:700px">
          <g:layoutBody />
        </div>
        <div style="float:right">
          <div class="rc" style="border:solid 1px #AAA;width:280px;">
            <div style="border-right:solid 4px #008000;min-height:160px;padding:5px">
              <g:render template='/elements/definition'/>
              <g:render template='/elements/systemInfo'/>
            </div>
          </div>
        </div>
      </div>
      <div style="clear:both"></div>
      <g:render template='/layouts/footer'/>
    </div>
  </body>
</html>