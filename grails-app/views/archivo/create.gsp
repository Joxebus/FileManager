<%@ page import="filemanager.Archivo" %>
<!doctype html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'archivo.label', default: 'Archivo')}"/>
    <title><g:message code="default.create.label" args="${[message(code:'archivo.form.file.label', default: 'File')]}"/></title>
</head>

<body>
<a href="#create-archivo" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                                default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="list"><g:message code="default.list.label" args="${[message(code:'archivo.form.file.label', default: 'File')]}"/></g:link></li>
    </ul>
</div>

<div id="create-archivo" class="content scaffold-create" role="main">
    <h1><g:message code="default.create.label" args="${[message(code:'archivo.form.file.label', default: 'File')]}"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${archivoInstance}">
        <ul class="errors" role="alert">
            <g:eachError bean="${archivoInstance}" var="error">
                <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
                        error="${error}"/></li>
            </g:eachError>
        </ul>
    </g:hasErrors>
    <g:form action="save" enctype="multipart/form-data">
        <fieldset class="form">
            <g:render template="form"/>
        </fieldset>
        <fieldset class="buttons">
            <g:submitButton name="create" class="save"
                            value="${message(code: 'default.button.create.label', default: 'Create')}"/>
        </fieldset>
    </g:form>
</div>
</body>
</html>
