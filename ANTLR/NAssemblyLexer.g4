lexer grammar NAssemblyLexer;

SECTION : 'section';
GLOBAL : 'global';

// TYPES
UINT8 : 'uint8';
UINT16 : 'uint16';
UINT32 : 'uint32';
UINT64 : 'uint64';

INT8 : 'int8';
INT16 : 'int16';
INT32 : 'int32';
INT64 : 'int64';

FLOAT32 : 'float32';
FLOAT64 : 'float64';
LONG: 'long';
ULONG: 'ulong';

STRING : 'string';
CHAR : 'char';

STRING_VALUE: '"' .*? '"';
CHAR_VALUE: '\'' . '\'';

BOOL: 'bool';

VOID : 'void';
NULL: 'null';

RETURN : 'return';
WHILE : 'while';

IDENTIFIER : [a-zA-Z][a-zA-Z0-9_]*;

HEX_NUMBER : '0x'[0-9a-fA-F]+;
BIN_NUMBER : '0b'[0-1]+;
FLOAT_NUMBER : [0-9]+ '.' [0-9]+;
INTEGER : [0-9]+;

ASSIGN_RIGHTTOLEFT : '<-';
ASSIGN_LEFTTORIGHT : '->';

PLUS : '+';
MINUS : '-';
MULTIPLY : '*';
DIVIDE : '/';
MODULO : '%';
POWER : '^';

EQUALS : '=';
NOTEQUALS : '!=';
GREATER : '>';
LESS : '<';
GREATEREQUALS : '>=';
LESSEQUALS : '<=';

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
