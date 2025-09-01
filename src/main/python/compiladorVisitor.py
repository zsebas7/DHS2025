# Generated from /home/meschoyez/Docencia/IUA/DHS/DHS2025/compilador/src/main/python/compilador.g4 by ANTLR 4.13.1
from antlr4 import *
if "." in __name__:
    from .compiladorParser import compiladorParser
else:
    from compiladorParser import compiladorParser

# This class defines a complete generic visitor for a parse tree produced by compiladorParser.

class compiladorVisitor(ParseTreeVisitor):

    # Visit a parse tree produced by compiladorParser#s.
    def visitS(self, ctx:compiladorParser.SContext):
        return self.visitChildren(ctx)



del compiladorParser