package filemanager

class Archivo {

    String  ubicacionLocal
    String  contentType
    String  extension
    String  descripcion
    String  nombre

    static constraints = {
        //tamano maxSize:5242880 // 5MB en bytes
        descripcion maxSize: 999999
    }

    String toString(){
        nombre.replaceAll(' ','_')+"."+extension
    }
}
