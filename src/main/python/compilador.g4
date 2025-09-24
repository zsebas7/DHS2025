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


NUMERO : DIGITO+ ;

//===================
//Palabras reservadas
//===================
INT : 'int' ;
DOUBLE : 'double' ; 
IF : 'if' ;
ELSE: 'else' ;
WHILE : 'while' ;
FOR: 'for' ;

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
            | bloque
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


ifor: FOR PA PYC PYC PC instruccion ; //incompleto

//============================
//Declaraciones y asignaciones
//============================

//int x;
declaracion: tipo ID  inic listavar PYC ;
tipo: INT
    | DOUBLE
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
asignacion : ID ASIG opal PYC ;

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
       | //agregar llamada a funcion
       ;
