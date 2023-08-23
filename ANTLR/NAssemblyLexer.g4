lexer grammar NAssemblyLexer;

SECTION: 'section';
GLOBAL: 'global';

WHILE: 'while';
IF: 'if';
FOR: 'for';

// TYPES
UINT8: 'uint8';
UINT16: 'uint16';
UINT32: 'uint32' | 'uint';
UINT64: 'uint64';
UINT128: 'uint128';

INT8: 'int8';
INT16: 'int16';
INT32: 'int32' | 'int';
INT64: 'int64';
INT128: 'int128';

FLOAT32: 'float32' | 'float';
FLOAT64: 'float64';
LONG: 'long';
ULONG: 'ulong';

STRING: 'string';
CHAR: 'char';

STRING_VALUE: '"' .*? '"';
CHAR_VALUE: '\'' . '\'';

BOOL: 'bool';

VOID: 'void';
MEOW: 'meow';
NULL: 'null';

RETURN: 'return';

IDENTIFIER: [a-zA-Z][a-zA-Z0-9_]*;

HEX_NUMBER: '0x' [0-9a-fA-F]+;
HEX_STRING: 'hex ' [0-9a-fA-F]+;

BIN_NUMBER: '0b' [0-1]+;
BIN_STRING: 'bin ' [0-1]+;

OCT_NUMBER: '0o' [0-7]+;
OCT_STRING: 'oct ' [0-7]+;

DEC_NUMBER: '0d' [0-9]+;
DEC_STRING: 'dec ' [0-9]+;

FLOAT_NUMBER: [0-9]+ '.' [0-9]+;
INTEGER: [0-9]+;

ASSIGN_RIGHTTOLEFT: '<-';
ASSIGN_LEFTTORIGHT: '->';

PLUS: '+';
MINUS: '-';
MULTIPLY: '*';
DIVIDE: '/';
MODULO: '%';
POWER: '^';

EQUALS: '=';
NOTEQUALS: '!=';
GREATER: '>';
LESS: '<';
GREATEREQUALS: '>=';
LESSEQUALS: '<=';

COLON: ':';
COMMA: ',';
PERIOD: '.';
SEMICOLON: ';';
OPEN_BRACKET: '[';
CLOSE_BRACKET: ']';
OPEN_PAREN: '(';
CLOSE_PAREN: ')';
OPEN_CURLY: '{';
CLOSE_CURLY: '}';
COMMENT: ';' .*? '\n' -> channel(HIDDEN);
WS: [ \t\n\r]+ -> skip;