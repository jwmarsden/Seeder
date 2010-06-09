<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta name="layout" content="main" />
    <title>Sample title</title>
  </head>
  <body>
    <h1>${message(code: 'seeder.heading.register')}</h1>
    <div class="register" style="width:600px">

      <g:if test="${flash.message}">
        <div class="message">${flash.message}</div>
      </g:if>
      <g:hasErrors bean="${person}">
        <div class="errors">
          <g:renderErrors bean="${person}" as="list" />
        </div>
      </g:hasErrors>
      <div class="info"><g:message code="seeder.message.register" /></div>
      <g:form action="register_save">
        <div class="dialog">
          <table>
            <tbody>

              <tr class="prop">
                <td valign="top" class="name"><label for="username">Login Name:</label></td>
                <td valign="top" class="value ${hasErrors(bean:person,field:'username','errors')}">
                  <input type="text" id="username" name="username" value="${person.username?.encodeAsHTML()}"/>
                </td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name"><label for="email">Email:</label></td>
                <td valign="top" class="value ${hasErrors(bean:person,field:'email','errors')}">
                  <input type="text" id="email" name="email" value="${person.email?.encodeAsHTML()}"/>
                </td>
              </tr>

              <tr class="prop">
                <td valign="top" class="name"><label for="emailShow">Show Email:</label></td>
                <td valign="top" class="value ${hasErrors(bean:person,field:'emailShow','errors')}">
            <g:checkBox name="emailShow" value="${person.emailShow}"/>
            </td>
            </tr>

            <tr class="prop">
              <td valign="top" class="name"><label for="passwd">Password:</label></td>
              <td valign="top" class="value ${hasErrors(bean:person,field:'passwd','errors')}">
                <input type="password" id="passwd" name="passwd" value="${person.passwd?.encodeAsHTML()}"/>
              </td>
            </tr>



            </tbody>
          </table>
        </div>

        <div class="buttons">
          <span class="button"><input class="save" type="submit" value="Create" /></span>
        </div>

      </g:form>




    </div>
  </body>
</html>
