lexer grammar NAssemblyLexer;

SECTION : 'section';
GLOBAL : 'global';
UINT32 : 'uint32';
UINT64 : 'uint64';
UINT128 : 'uint128';
FLOAT : 'float';
RETURN : 'return';
WHILE : 'while';
VOID : 'void';
IDENTIFIER : [a-zA-Z][a-zA-Z0-9_]*;

HEX_NUMBER : '0x'[0-9a-fA-F]+;
FLOAT_NUMBER : [0-9]+ '.' [0-9]+;
INTEGER : [0-9]+;

ASSIGN_RIGHTTOLEFT : '<-';
ASSIGN_LEFTTORIGHT : '->';

EQUALS : '=';
COLON : ':';
COMMA : ',';
SEMICOLON : ';';
OPEN_BRACKET : '[';
CLOSE_BRACKET : ']';
OPEN_PAREN : '(';
CLOSE_PAREN : ')';
OPEN_CURLY : '{';
CLOSE_CURLY : '}';
COMMENT : ';' .*? '\n' -> channel(HIDDEN);
WS : [ \t\n\r]+ -> skip;
