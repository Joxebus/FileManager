<%@ page import="filemanager.Archivo" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'archivo.label', default: 'Archivo')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-archivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                              default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="list-archivo" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <g:sortableColumn property="file" title="${message(code: 'archivo.file.label', default: 'File')}"/>

            <g:sortableColumn property="contentType"
                              title="${message(code: 'archivo.contentType.label', default: 'Content Type')}"/>

            <g:sortableColumn property="extension"
                              title="${message(code: 'archivo.extension.label', default: 'Extension')}"/>

            <g:sortableColumn property="nombre" title="${message(code: 'archivo.nombre.label', default: 'Nombre')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${archivoInstanceList}" status="i" var="archivoInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td>
                    <g:if test="${archivoInstance.contentType.contains('audio')}">
                            <audio controls>
                                <source src="${createLink(controller: 'archivo', action: 'downloadFile', id: archivoInstance.id)}" type="${archivoInstance.contentType}">
                            </audio>
                        </g:if>
                    <a href="${createLink(controller: 'archivo', action: 'downloadFile', id: archivoInstance.id)}" alt="${archivoInstance}">
                        <g:if test="${archivoInstance.contentType.contains('image')}">
                            <img src="${createLink(controller: 'archivo', action: 'downloadFile', id: archivoInstance.id)}" alt="${archivoInstance.nombre}" width="100px"/>
                        </g:if>

                        <g:else>
                        Descargar
                        </g:else>
                    </a>
                </td>

                <td>${fieldValue(bean: archivoInstance, field: "contentType")}</td>

                <td>${fieldValue(bean: archivoInstance, field: "extension")}</td>

                <td><g:link action="show"
                            id="${archivoInstance.id}">${fieldValue(bean: archivoInstance, field: "nombre")}</g:link></td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${archivoInstanceTotal}"/>
    </div>
</div>
</body>
</html>
