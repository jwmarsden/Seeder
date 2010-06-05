
<%@ page import="openecho.Profile" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
  <title><g:message code="default.show.label" args="[entityName]" /></title>
  <jq:jquery>
    $(document).ready(function() {
      $("#tabs").tabs({ disabled: [2] });
      $("#profilePerformance .metric").hover(
      function () {
        $(this).addClass("hover");
      },
      function () {
        $(this).removeClass("hover");
      })
    });


  </jq:jquery>
  <link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<!--
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
  <span class="menuButton"><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></span>
</div>

<div id="menubar">
  <ul>
    <li>Something</li>
    <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
  </ul>
</div>
-->
<div class="body">
  <div class="title">
    <h2 style=""><g:message code="default.show.label" args="[entityName]" /></h2><!--Filter results:<input type="text" value="" />-->
  </div>
  <div id="profileDetail">
    <g:if test="${flash.message}">
      <div class="message">${flash.message}</div>
    </g:if>
    <div class="profile">
      <div class="profileInfo rc shaded">
        <img class="profilePhoto" src="<g:createLinkTo dir='images' file='user.png'/>" alt="photo" />

        <div class="profileData">
          <div class="head">${fieldValue(bean: profileInstance, field: "displayName")}</div>
          <div id="profilePerformance">
            <h3 class="metric rc shaded">4<span>Followers</span></h3>
            <h3 class="metric rc shaded">8000<span>Seeds</span></h3>
            <h3 class="metric rc shaded">450<span>Edits</span></h3>
          </div>
        </div>

        <div style="clear:both"></div>
      </div>
      <div id="tabs" style="clear:both">
        <ul>
          <li><a href="#biography"><span>Biography</span></a></li>
          <li><a href="#relationships"><span>Relationships</span></a></li>
          <li><a class="seeds" href="#seeds"><span>Seeds</span></a></li>
        </ul>
        <div id="biography" class="shaded" style="min-height:300px">
          <markdown:renderHtml>${fieldValue(bean: profileInstance, field: "biography")}</markdown:renderHtml>
        </div>
        <div id="relationships">

        </div>
        <div id="seeds">
        </div>
      </div>
    </div>

  </div>

  <!--
  <div id="profileMenu">
    <button>Follow Profile</button>
    <button>Block Profile</button>
  </div>
  <div class="buttons" style="clear:both">
    <g:form>
    <g:hiddenField name="id" value="${profileInstance?.id}" />
    <span class="button"><g:actionSubmit class="edit" action="edit" value="${message(code: 'default.button.edit.label', default: 'Edit')}" /></span>
      <span class="button"><g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" /></span>
  </g:form>
  </div>
  -->

</div>
<div style="clear:both;"></div>
<div class="rc shaded" style="margin-top:2px;min-height:50px">

</div>
</body>
</html>
