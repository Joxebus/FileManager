package filemanager


class ReportesArchivoController {

    def jasperService
    def grailsApplication

    def descargarReporte(){
        Map params = [:]
        List<Map> elements = []
        params.put("_file", "reporte_archivos.jrxml")
        params.put("_format", "PDF")
        params.put("REPORT_DATE", new java.text.SimpleDateFormat("dd-MMMM-yyyy", Locale.ENGLISH).format(new Date()).toUpperCase())


        Archivo.findAll().each{ archivo ->
            elements << archivo.properties

        }


        List<Map> data = [["TABLE_ELEMENTS": elements]]

        println "PARAMS: "+params
        println "DATA: "+data
        flash.message = message(code: "archivo.download.generated", default: "Archivo Generado Existosamente")

        chain(controller: "jasper", action: "index", model: [data: data], params: params)

        /*def reportDef = jasperService.buildReportDefinition(params, request.getLocale(), elements)

        byte[] reportBytes = jasperService.generateReport(reportDef).toByteArray()
        response.setHeader("Content-disposition", "attachment;filename=Reporte-Archivos.pdf")
        response.contentType = grailsApplication.config.grails.mime.types['pdf']
        response.outputStream << reportBytes
        response.outputStream.flush()*/

    }
}
