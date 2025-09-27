grammar compilador;

fragment LETRA : [A-Za-z] ;
fragment DIGITO : [0-9] ;

//============
//Simbolos
//============
PA  : '(' ;
PC  : ')' ;
LLA : '{' ;
LLC : '}' ;
PYC : ';' ;

IGUAL    : '==' ;
DISTINTO :'!=' ;
MAYOR    : '>' ;
MENOR    : '<' ;
MAYORIG  : '>=' ;
MENORIG  : '<=' ;
AND      : '&&' ;
OR       : '||' ;
NOT      : '!' ;

ASIG  : '=' ;
COMA  : ',' ;
SUMA  : '+' ;
RESTA : '-' ;
MULT  : '*' ;
DIV   : '/' ;
MOD   : '%' ;
INC   : '++';
DEC   : '--';


NUMERO : DIGITO+ ;

//===================
//Palabras reservadas
//===================
INT    : 'int'    ;
DOUBLE : 'double' ; 
VOID   : 'void'   ;

IF     : 'if'    ;
ELSE   : 'else'  ;
WHILE  : 'while' ;
FOR    : 'for'   ;
RETURN : 'return';

ID : (LETRA | '_')(LETRA | DIGITO | '_')* ;

WS : [ \n\r\t] -> skip;
OTRO : . ;

s : ID     {print("ID ->" + $ID.text + "<--") }         s
  | NUMERO {print("NUMERO ->" + $NUMERO.text + "<--") } s
  | OTRO   {print("Otro ->" + $OTRO.text + "<--") }     s
  | EOF
  ;

//s : PA s PC s
//|
//;

//=======================
//Estructura del programa
//=======================

//lectura del archivo linea por linea
programa : instrucciones EOF;

//instrucciones es una instruccion seguido de mas instrucciones
instrucciones : instruccion instrucciones
              |
              ;


//una instruccion puede ser...
instruccion : asignacion
            | declaracion
            | iif
            | iwhile
            | ifor
            | ireturn
            | bloque
            | prototipo
            | funcion
            | llamada PYC
            ;

//bloque = {...} --> agrupa varias instrucciones
bloque : LLA instrucciones LLC ;

//================
//Control de flujo
//================

//while(condicion) instruccion [else instruccion opcional]
iwhile: WHILE PA opal PC instruccion ;

//if(condicion) instruccion
iif: IF PA opal PC instruccion ielse;
//puede o no estar el else
ielse : ELSE instruccion
      |
      ;


ifor: FOR PA forInicializacion PYC forCond PYC forActualizacion PC instruccion
    | FOR PA forInicializacion PYC forCond PYC forActualizacion PC PYC 
    ; 

//inicializacion: puede ser una declaracion de tipo con varias variables o asignaciones individuales
forInicializacion: tipo ID inic listavar // int x, y, z (CON TIPO)
                 | expASIG listaExpASIG // x = 10, y = 20 (PARA VARIABLES YA EXISTENTES)
                 | 
                 ;
//lista de asignaciones para variables existentes
listaExpASIG: COMA expASIG listaExpASIG
            |
            ;

//comparacion:
//solo se puede poner una cond que se evaluará como verdadero o falso, no se pueden poner
//condiciones separadas por coma
forCond: opal
       |
       ;

//actualizacion:
//en la parte de actualizacion si se puede separar por coma
forActualizacion: exp listaActualizacion
                |
                ;
listaActualizacion: COMA exp listaActualizacion
                  |
                  ;


ireturn: RETURN opal PYC;
//============================
//Declaraciones y asignaciones
//============================

//int x;
declaracion: tipo ID  inic listavar PYC ;
tipo: INT
    | DOUBLE
    | VOID
    ;

//para poner una lista de variables en la declaracion, int x, y, z;
listavar: COMA ID inic listavar
        |
        ;

//para asignaciones en la declaracion int x = 10;
inic : ASIG opal 
     |
     ;

//asignaciones del tipo x = opal;
expASIG : ID ASIG opal ;
asignacion : expASIG PYC ;

//===========
//Expresiones
//===========

//operaciones aritmeticas y logicas
opal: expOR ;

//va una por una para seguir el orden de precedencia
expOR : expAND o ;
o : OR expAND o
  |
  ;
expAND : expIGUAL a ;
a : AND expIGUAL a
  |
  ;
expIGUAL : expCOMP i ;
i : IGUAL expCOMP i 
  | DISTINTO expCOMP i
  |
  ;
expCOMP : exp c ;
c : MENOR exp c
  | MAYOR exp c
  | MENORIG exp c
  | MAYORIG exp c
  |
  ; 
//expresiones estan formadas por uno o mas terminos
exp : term e ;
e   : SUMA term e
    | RESTA term e
    |  
    ;
//terminos estan formados por uno o mas factores
term : factor t ;
t    : MULT factor t
     | DIV factor t
     | MOD factor t
     |
     ;

factor : NUMERO
       | ID
       | PA opal PC
       | llamada
       | NOT factor //!x
       | INC factor //++x
       | DEC factor //--x
       | factor INC //x++
       | factor DEC //x--
       ;

//=========
//FUNCIONES
//=========

//prototipo de funcion
prototipo : tipo ID PA parametros PC PYC ;
parametros : parametro listaParametros
           |
           ;
listaParametros: COMA parametro listaParametros
               |
               ;
//un parametro puede ser un tipo seguido de 1 o mas IDs
parametro: tipo ID listaID ;
//permite varias IDs despues del primero
listaID: COMA ID listaID
       |
       ;
//llamada a la funcion
llamada : ID PA listaArg PC ;
listaArg: opal argumentos //permite 0 o mas argumentos f(x, y)
        | // f()
        ;
argumentos: COMA opal argumentos
          |
          ;

//declaracion
funcion : tipo ID PA parametros PC bloque; //si o si deben tener bloque, si tienen una sola instruccion debe estar dentro del bloque


