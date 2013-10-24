package filemanager

class Archivo {

    String  ubicacionLocal
    String  contentType
    String  extension
    String  nombre

    static constraints = {
        //tamano maxSize:5242880 // 5MB en bytes
    }

    String toString(){
        nombre.replaceAll(' ','_')+"."+extension
    }
}
