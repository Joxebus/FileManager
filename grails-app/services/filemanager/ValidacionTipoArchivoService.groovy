package filemanager

/**
 * @author : Jorge Omar Bautista Valenzuela
 * date: 29/01/2013
 * time: 17:47
 * Este servicio identifica los los mimes de los tipos de archivo
 *
 * Declarar los mimes que se quieran utilizar en el mapa grails.mime.types en el archivo Config.groovy
 */
class ValidacionTipoArchivoService {

	def grailsApplication

    String findMime(String extension) {
        log.debug "Validando mime de la extension $extension"
        grailsApplication.config.grails.mime.types[extension?.toLowerCase()]
    }

}