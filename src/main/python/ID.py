class ID:
    #cuando se crea una clase 
    def __init__(self, nombre:str, tipoDato: str):
        self.nombre = nombre
        self.tipoDato = tipoDato
        self.inicializado = False
        self.usado = False
    
    #=================
    #getters y setters
    #=================
    def getNombre(self):
        return self.nombre
    
    def getTipoDato(self):
        return self.tipoDato
    
    #valor = True lo pone como True por defecto si no se especifica pero al tener el valor y no ponerlo
    #directamente en self.inicializado permite poner False si se llega a necesitar en algun caso
    def setInicializado(self, valor = True):
        self.inicializado = valor
        
    def getInicializado(self):
        return self.inicializado
    
    def setUsado(self, valor= True):
        self.usado = valor
        
    def getUsado(self):
        return self.usado