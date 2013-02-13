<%@ page import="filemanager.Archivo" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'archivo.label', default: 'Archivo')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-archivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-archivo" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list archivo">

        <g:if test="${archivoInstance?.file}">
            <li class="fieldcontain">
                <span id="file-label" class="property-label"><g:message code="archivo.file.label"
                                                                        default="File"/></span>

            </li>
        </g:if>

        <g:if test="${archivoInstance?.contentType}">
            <li class="fieldcontain">
                <span id="contentType-label" class="property-label"><g:message code="archivo.contentType.label"
                                                                               default="Content Type"/></span>

                <span class="property-value" aria-labelledby="contentType-label"><g:fieldValue bean="${archivoInstance}"
                                                                                               field="contentType"/></span>

            </li>
        </g:if>

        <g:if test="${archivoInstance?.extension}">
            <li class="fieldcontain">
                <span id="extension-label" class="property-label"><g:message code="archivo.extension.label"
                                                                             default="Extension"/></span>

                <span class="property-value" aria-labelledby="extension-label"><g:fieldValue bean="${archivoInstance}"
                                                                                             field="extension"/></span>

            </li>
        </g:if>

        <g:if test="${archivoInstance?.nombre}">
            <li class="fieldcontain">
                <span id="nombre-label" class="property-label"><g:message code="archivo.nombre.label"
                                                                          default="Nombre"/></span>

                <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${archivoInstance}"
                                                                                          field="nombre"/></span>

            </li>
        </g:if>

    </ol>
    <g:form>
        <fieldset class="buttons">
            <g:hiddenField name="id" value="${archivoInstance?.id}"/>
            <g:link class="edit" action="edit" id="${archivoInstance?.id}"><g:message code="default.button.edit.label"
                                                                                      default="Edit"/></g:link>
            <g:actionSubmit class="delete" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
