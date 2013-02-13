package filemanager

class Archivo {

    byte[] file
    String contentType
    String extension
    String nombre

    static constraints = {
        file maxSize:5242880 // 5MB en bytes
    }

    String toString(){
        nombre+"."+extension
    }
}
