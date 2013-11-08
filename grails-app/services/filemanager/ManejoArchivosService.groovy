package filemanager

import util.FileBinaryDownload

class ManejoArchivosService {

    def grailsApplication
    def validacionTipoArchivoService

    def guardarArchivo (params){

        String nombreCompleto // trae el nombre del archivo
        if(params.archivo.bytes){
            nombreCompleto = params.archivo.getFileItem().getName()
        }else if(params.url){
            nombreCompleto = params.url.substring(params.url.lastIndexOf('/')+1)
            def file = new File("/tmp/"+nombreCompleto)
            use (FileBinaryDownload){
                file << params.url.toURL()
            }
            params.archivo = file
        }
        log.debug "Guardando en file system: $nombreCompleto"
        if(params.archivo.getBytes().length > grailsApplication.config.local.max.size.files){
            log.error "El tamaño maximo por archivo es de ${grailsApplication.config.local.max.size.files / 1048576} MB"
            return false
        }

        Archivo archivo = new Archivo()

        archivo.nombre = nombreCompleto.substring(0, nombreCompleto.lastIndexOf("."))
        archivo.extension = nombreCompleto.substring(nombreCompleto.lastIndexOf(".")+1)
        archivo.contentType = validacionTipoArchivoService.findMime(nombreCompleto.substring(nombreCompleto.lastIndexOf('.')+1))
        archivo.ubicacionLocal = grailsApplication.config.local.url.files+archivo.toString()
        File ubicacionLocal = new File(grailsApplication.config.local.url.files)
        if(!ubicacionLocal.exists()){
           ubicacionLocal.mkdir()
        }
        if(!archivo.save()){
            log.error "No se pudo guardar el archivo"
            archivo.errors.each{
                log.error it
            }
            return false

        }else{
            try{
                FileOutputStream archivoOut = new FileOutputStream(archivo.ubicacionLocal)
                archivoOut.write(params.archivo.bytes)
                log.debug "Se guardo correctamente el archivo ${archivo.ubicacionLocal}"
            }catch(Exception e){
                log.error "No se pudo guardar el archivo ${e.message}"
                archivo.delete()
                return false
            }
        }
        return archivo
    }

    def eliminarArchivo(params){
        Archivo archivo = Archivo.get(params.idArchivo)
        String nombreArchivo = archivo.toString()
        log.debug "Obteniendo de file system: ${archivo.ubicacionLocal}"
        File archivoIn = new File(archivo.ubicacionLocal)
        log.debug "Eliminando archivo del sistema"
        archivoIn.delete()
        archivo.delete()
        return nombreArchivo

    }

    def obtenerArchivo(params) {
        Archivo archivo = Archivo.get(params.idArchivo)
        log.debug "Obteniendo de file system: ${archivo.ubicacionLocal}"
        return new File(archivo.ubicacionLocal)
    }
}
