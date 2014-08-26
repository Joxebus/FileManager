<%@ page import="filemanager.Archivo" %>


<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'file', 'error')} required">
    <label for="file">
        <g:message code="archivo.form.file.label" default="File"/>
        <span class="required-indicator">*</span>
    </label>
    <input type="file" id="archivo" name="archivo"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'file', 'error')} required">
    <label for="url">
        <g:message code="archivo.form.url.label" default="URL"/>
    </label>
    <g:field type="url" name="url"
             placeholder="${message(code:'archivo.form.url.placeholder', default: 'Enter the URL of the file')}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'descripcion', 'error')} required">
    <label for="descripcion">
        <g:message code="archivo.form.description.label" default="Description"/>
    </label>
    <g:textArea name="descripcion" cols="30" rows="5"
                placeholder="${message(code:'archivo.form.description.placeholder', default: 'Enter a description')}"/>
</div>


