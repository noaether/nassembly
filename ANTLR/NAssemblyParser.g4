parser grammar NAssemblyParser;

options {
	tokenVocab = NAssemblyLexer;
}

program: section*;

section: SECTION IDENTIFIER block;

block:
	OPEN_CURLY data* CLOSE_CURLY
	| OPEN_CURLY function* CLOSE_CURLY;

data: type COLON IDENTIFIER EQUALS value;

function:
	GLOBAL IDENTIFIER
	| IDENTIFIER OPEN_CURLY statement* CLOSE_CURLY
	| IDENTIFIER input* ASSIGN_LEFTTORIGHT output* OPEN_CURLY statement CLOSE_CURLY;

statement: data | execute;

execute:
	IDENTIFIER IDENTIFIER ASSIGN_LEFTTORIGHT value
	| IDENTIFIER IDENTIFIER ASSIGN_RIGHTTOLEFT value;

value: HEX_NUMBER | FLOAT_NUMBER | IDENTIFIER;

type: UINT32 | UINT64 | UINT128 | FLOAT | VOID;

input: type | type COMMA;

output: type | type COMMA;