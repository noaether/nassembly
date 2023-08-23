parser grammar NAssemblyParser;

options {
	tokenVocab = NAssemblyLexer;
}

program: section*;

section: SECTION IDENTIFIER block;

block:
	OPEN_CURLY data* CLOSE_CURLY
	| OPEN_CURLY function* CLOSE_CURLY;

function:
	GLOBAL IDENTIFIER
	| IDENTIFIER OPEN_CURLY statement* CLOSE_CURLY
	| IDENTIFIER input* ASSIGN_LEFTTORIGHT output* OPEN_CURLY statement* RETURN value CLOSE_CURLY
	| IDENTIFIER input* ASSIGN_LEFTTORIGHT VOID OPEN_CURLY statement* CLOSE_CURLY;

input: types | types COMMA | types OPEN_BRACKET CLOSE_BRACKET;
output: types | types COMMA;

statement: data | execute;

data:
	declaration
	| argscatcher
	| edit;

declaration: 
	types COLON IDENTIFIER EQUALS value
	| types OPEN_BRACKET value CLOSE_BRACKET COLON IDENTIFIER EQUALS array
	| types OPEN_BRACKET CLOSE_BRACKET COLON IDENTIFIER EQUALS array;

edit: IDENTIFIER EQUALS value
	| IDENTIFIER PLUS PLUS
	| IDENTIFIER MINUS MINUS;

array: OPEN_BRACKET args* CLOSE_BRACKET;

execute: mov | whileloop | ifloop;

mov:
	IDENTIFIER IDENTIFIER ASSIGN_LEFTTORIGHT value
	| IDENTIFIER IDENTIFIER ASSIGN_RIGHTTOLEFT value;

whileloop:
	WHILE OPEN_PAREN value CLOSE_PAREN OPEN_CURLY statement* CLOSE_CURLY;

ifloop :
	IF OPEN_PAREN value comparison value CLOSE_PAREN OPEN_CURLY statement* CLOSE_CURLY;

forloop :
	FOR OPEN_PAREN fordeclaration COMMA forcomparison COMMA foredit;

fordeclaration: num_types COLON IDENTIFIER EQUALS value;
forcomparison: IDENTIFIER comparison_operator value;
foredit: edit;

value:
	number
	| functioncall
	| functionvalue
	| cast
	| IDENTIFIER OPEN_BRACKET value CLOSE_BRACKET
	| IDENTIFIER
	| STRING_VALUE
	| CHAR_VALUE
	| OPEN_PAREN value CLOSE_PAREN
	| number operator number
	| IDENTIFIER operator value
	| value bytevalue;

number:
	HEX_NUMBER
	| DEC_NUMBER
	| BIN_NUMBER
	| OCT_NUMBER
	| FLOAT_NUMBER
	| HEX_STRING
	| DEC_STRING
	| BIN_STRING
	| OCT_STRING
	| INTEGER;

operator:
	PLUS
	| MINUS
	| MULTIPLY
	| DIVIDE
	| MODULO;

args: value | value COMMA;

argscatcher:
	types COLON value
	| types OPEN_BRACKET CLOSE_BRACKET COLON IDENTIFIER;

cast: OPEN_PAREN types CLOSE_PAREN value;

functionvalue:
	IDENTIFIER PERIOD IDENTIFIER
	| IDENTIFIER PERIOD functionvalue;

functioncall:
	IDENTIFIER OPEN_PAREN args* CLOSE_PAREN
	| IDENTIFIER OPEN_PAREN CLOSE_PAREN;

bytevalue: OPEN_BRACKET INTEGER COLON INTEGER CLOSE_BRACKET;

comparison_operator:
	EQUALS
	| NOTEQUALS
	| GREATER
	| LESS
	| GREATEREQUALS
	| LESSEQUALS;

types:
	num_types
	| STRING
	| CHAR
	| VOID
	| MEOW;

num_types: uintegers | integers | floats | longs;

uintegers: UINT8 | UINT16 | UINT32 | UINT64 | UINT128;
integers: INT8 | INT16 | INT32 | INT64 | INT128;
floats: FLOAT32 | FLOAT64;
longs: LONG | ULONG;