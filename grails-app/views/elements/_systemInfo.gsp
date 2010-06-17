<div class="subPannel tree">
  <h3>Application Status</h3>
  <ul style="margin-bottom:5px">
          <li><em>App version:</em> <g:meta name="app.version"></g:meta></li>
          <li><em>Grails version:</em> <g:meta name="app.grails.version"></g:meta></li>
          <li><em>JVM version:</em> ${System.getProperty('java.version')}</li>
          <li><em>Controllers:</em> ${grailsApplication.controllerClasses.size()}</li>
          <li><em>Domains:</em> ${grailsApplication.domainClasses.size()}</li>
          <li><em>Services:</em> ${grailsApplication.serviceClasses.size()}</li>
          <li><em>Tag Libraries:</em> ${grailsApplication.tagLibClasses.size()}</li>
  </ul>
  <h3>Installed Plugins</h3>
  <ul>
          <g:set var="pluginManager"
                 value="${applicationContext.getBean('pluginManager')}"></g:set>

          <g:each var="plugin" in="${pluginManager.allPlugins}">
                  <li><em>${plugin.name}</em> - ${plugin.version}</li>
          </g:each>

  </ul>
</div>
