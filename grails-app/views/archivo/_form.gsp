<%@ page import="filemanager.Archivo" %>



<div class="fieldcontain ${hasErrors(bean: archivoInstance, field: 'file', 'error')} required">
    <label for="file">
        <g:message code="archivo.file.label" default="File"/>
        <span class="required-indicator">*</span>
    </label>
    <input type="file" id="archivo" name="archivo"/>
</div>



