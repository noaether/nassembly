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

input: types | types COMMA;
output: types | types COMMA;

statement: data | execute;

data: types COLON IDENTIFIER EQUALS value;

execute:
	IDENTIFIER IDENTIFIER ASSIGN_LEFTTORIGHT value
	| IDENTIFIER IDENTIFIER ASSIGN_RIGHTTOLEFT value;

value:
  | number
	| functioncall
	| IDENTIFIER
	| STRING_VALUE
	| CHAR_VALUE
	| OPEN_PAREN value CLOSE_PAREN
	| number operator number;

number:
  HEX_NUMBER
  | DEC_NUMBER
  | BIN_NUMBER
  | OCT_NUMBER
  | FLOAT_NUMBER
  | HEX_STRING
  | DEC_STRING
  | BIN_STRING
  | OCT_STRING;

operator:
	PLUS
	| MINUS
	| MULTIPLY
	| DIVIDE
	| MODULO
	| EQUALS
	| NOTEQUALS
	| LESS
	| GREATER
	| LESSEQUALS
	| GREATEREQUALS;

args: value | value COMMA;

functioncall:
	IDENTIFIER OPEN_PAREN args* CLOSE_PAREN
	| IDENTIFIER OPEN_PAREN CLOSE_PAREN;

types:
	UINT8
	| UINT16
	| UINT32
	| UINT64
	| INT8
	| INT16
	| INT32
	| INT64
	| FLOAT32
	| FLOAT64
	| STRING
	| CHAR
	| VOID;