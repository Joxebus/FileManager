package util
/**
 *
 * User: Joxebus
 * Date: 26/08/2014
 * Time: 07:18 PM
 *
 * This class is used by the ManejoArchivosService to download a file from web
 */
class FileBinaryDownload {

    def static leftShift(File file, URL url){
        url.withInputStream {is->
            file.withOutputStream {os->
                def bs = new BufferedOutputStream( os )
                bs << is
            }
        }
    }

}
