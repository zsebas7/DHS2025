from ID import ID

class Contexto:
    def __init__(self):
        #diccionario de simbolos
        #clave = ID, valor = objeto ID
        self.simbolos = {}
    
    def addSimbolo(self, id_obj: ID):
        #agrega un simbolo en el contexto actual.
        #si ya existe, error
        nombre = id_obj.getNombre()
        if nombre in self.simbolos:
            raise ValueError #se puede agregar un comentario de error (HACER DSP)
        self.simbolos[nombre] = id_obj
        
    def buscarSimbolo(self,nombre):
        #busca un simbolo con el nombre en el contexto, si no encuentra ninguno devuelve None
        return self.simbolos.get(nombre, None)