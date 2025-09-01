# Generated from /home/meschoyez/Docencia/IUA/DHS/DHS2025/compilador/src/main/python/compilador.g4 by ANTLR 4.13.1
from antlr4 import *
from io import StringIO
import sys
if sys.version_info[1] > 5:
    from typing import TextIO
else:
    from typing.io import TextIO


def serializedATN():
    return [
        4,0,3,34,6,-1,2,0,7,0,2,1,7,1,2,2,7,2,2,3,7,3,2,4,7,4,1,0,1,0,1,
        1,1,1,1,2,4,2,17,8,2,11,2,12,2,18,1,3,1,3,1,4,1,4,3,4,25,8,4,1,4,
        1,4,1,4,5,4,30,8,4,10,4,12,4,33,9,4,0,0,5,1,0,3,0,5,1,7,2,9,3,1,
        0,2,2,0,65,90,97,122,1,0,48,57,36,0,5,1,0,0,0,0,7,1,0,0,0,0,9,1,
        0,0,0,1,11,1,0,0,0,3,13,1,0,0,0,5,16,1,0,0,0,7,20,1,0,0,0,9,24,1,
        0,0,0,11,12,7,0,0,0,12,2,1,0,0,0,13,14,7,1,0,0,14,4,1,0,0,0,15,17,
        3,3,1,0,16,15,1,0,0,0,17,18,1,0,0,0,18,16,1,0,0,0,18,19,1,0,0,0,
        19,6,1,0,0,0,20,21,9,0,0,0,21,8,1,0,0,0,22,25,3,1,0,0,23,25,5,95,
        0,0,24,22,1,0,0,0,24,23,1,0,0,0,25,31,1,0,0,0,26,30,3,1,0,0,27,30,
        3,3,1,0,28,30,5,95,0,0,29,26,1,0,0,0,29,27,1,0,0,0,29,28,1,0,0,0,
        30,33,1,0,0,0,31,29,1,0,0,0,31,32,1,0,0,0,32,10,1,0,0,0,33,31,1,
        0,0,0,5,0,18,24,29,31,0
    ]

class compiladoresLexer(Lexer):

    atn = ATNDeserializer().deserialize(serializedATN())

    decisionsToDFA = [ DFA(ds, i) for i, ds in enumerate(atn.decisionToState) ]

    NUMERO = 1
    OTRO = 2
    ID = 3

    channelNames = [ u"DEFAULT_TOKEN_CHANNEL", u"HIDDEN" ]

    modeNames = [ "DEFAULT_MODE" ]

    literalNames = [ "<INVALID>",
 ]

    symbolicNames = [ "<INVALID>",
            "NUMERO", "OTRO", "ID" ]

    ruleNames = [ "LETRA", "DIGITO", "NUMERO", "OTRO", "ID" ]

    grammarFileName = "compilador.g4"

    def __init__(self, input=None, output:TextIO = sys.stdout):
        super().__init__(input, output)
        self.checkVersion("4.13.1")
        self._interp = LexerATNSimulator(self, self.atn, self.decisionsToDFA, PredictionContextCache())
        self._actions = None
        self._predicates = None


