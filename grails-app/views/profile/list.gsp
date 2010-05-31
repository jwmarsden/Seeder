
<%@ page import="openecho.Profile" %>
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
  <meta name="layout" content="main" />
  <g:set var="entityName" value="${message(code: 'profile.label', default: 'Profile')}" />
  <title><g:message code="default.list.label" args="[entityName]" /></title>
  <jq:jquery>
    $("#profileList .profile").hover(
      function () {
        $(this).addClass("hover");
      },
      function () {
        $(this).removeClass("hover");
      }
    );
  </jq:jquery>
</head>
<body>
<div class="nav">
  <span class="menuButton"><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></span>
</div>
<div class="body">
  <div class="title">
    <h2 style=""><g:message code="default.list.label" args="[entityName]" /></h2><!--Filter results:<input type="text" value="" />-->
  </div>
  <g:if test="${flash.message}">
    <div class="message">${flash.message}</div>
  </g:if>
  <div id="profileList" class="list">
    <g:if test="${profileInstanceList}">
      <div class="message">There are no profile instances registered. Create an account here.</div>
    </g:if>
    <g:each in="${profileInstanceList}" status="i" var="profileInstance">


      <div class="profile" onclick="window.location='/seeder.git/profile/show/${fieldValue(bean: profileInstance, field: "id")}'">
        <div class="profileInfo">
          <img class="profilePhoto" src="<g:createLinkTo dir='images' file='user.png'/>" alt="photo" />

          <div class="profileData">
            <div class="head">${fieldValue(bean: profileInstance, field: "displayName")}</div>
          </div>

          <div class="profileTrophies"><img style="height:20;width:20"><img style="height:20;width:20"><img style="height:20;width:20"></div>
        </div>
      </div>


    </g:each>



  </div>


</div>
</body>
</html>
