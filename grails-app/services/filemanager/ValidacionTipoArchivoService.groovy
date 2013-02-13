package filemanager

/**
 * @author : Jorge Omar Bautista Valenzuela
 * date: 29/01/2013
 * time: 17:47
 * Este servicio identifica los los mimes de los tipos de archivo
 */

class ValidacionTipoArchivoService {

	def document = ["doc", "docx","xls","xlsx","pdf"]
	def documentMime = ["application/msword", "application/vnd.openxmlformats-officedocument.wordprocessingml.document",'application/vnd.ms-excel','application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',"application/pdf"]

	def audio= ["mp3", "wav", "wma"]
	def audioMime=["audio/x-mpeg-3", "audio/wav", "audio/x-ms-wma"]

    def image=["jpg","jpeg", "gif", "png", "jpe", "bmp"]
	def imageMime=["image/jpeg", "image/jpeg", "image/gif", "image/png", "image/jpeg", "image/bmp" ]


	String isDocument(String extension){
		extension = extension.toLowerCase()
		def index = document.indexOf(extension)
        println index
        println "MIME de la extension $extension"
        return index > -1 ? documentMime[index] : null
	}


	String isAudio(String extension){
		extension = extension.toLowerCase()
		def index = audio.indexOf(extension)
        println index
        println "MIME de la extension $extension"
        return index > -1 ? audioMime[index] : null
	}

	String isImage(String extension){
		extension = extension.toLowerCase()
		def index = image.indexOf(extension)
        println imageMime[index]
        println "MIME de la extension $extension"
        return index > -1 ? imageMime[index] : null
	}


}