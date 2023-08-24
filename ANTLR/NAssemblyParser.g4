parser grammar NAssemblyParser;

options {
	tokenVocab = NAssemblyLexer;
}

program: section*;

section: SECTION IDENTIFIER block;

block:
	OPEN_CURLY declaration* CLOSE_CURLY	# dataBlock
	| OPEN_CURLY function* CLOSE_CURLY	# textBlock;

function:
	(GLOBAL fxname)+																							# mainLabel // mainLabel->IDENTIFIER = mainFunction->IDENTIFIER
	| (fxname OPEN_CURLY statement* CLOSE_CURLY)+									# mainFunction
	| fxname fxio OPEN_CURLY argscatchers? statement* RETURN value CLOSE_CURLY	# returnFunction
	| fxname fxvoid OPEN_CURLY argscatchers? statement* CLOSE_CURLY							# noReturnFunction;

fxname: IDENTIFIER;
fxio: fxin* ASSIGN_LEFTTORIGHT fxout* # inputOutput;
fxvoid: fxin* ASSIGN_LEFTTORIGHT VOID # inputNoOut;

fxin: types | types COMMA;
fxout: types | types COMMA;

statement: data | execute;

data: declaration | edit;

argscatchers:
	types COLON IDENTIFIER								# simpleArgscatchVar
	| types OPEN_BRACKET CLOSE_BRACKET COLON IDENTIFIER	# arrayArgscatchVar;

declaration:
  types COLON IDENTIFIER EQUALS value				# simpleVar
	| types OPEN_BRACKET value? CLOSE_BRACKET COLON IDENTIFIER EQUALS (
		(OPEN_BRACKET (value | value COMMA)* CLOSE_BRACKET)
		| (value)
	) # arrayVar;

edit:
	IDENTIFIER EQUALS value
	| IDENTIFIER PLUS PLUS
	| IDENTIFIER MINUS MINUS
	| IDENTIFIER (PLUS EQUALS | EQUALS PLUS) value
	| IDENTIFIER (MINUS EQUALS | EQUALS MINUS) value;

array: OPEN_BRACKET args* CLOSE_BRACKET;

execute: mov | whileloop | ifloop;

mov:
	MOV IDENTIFIER ASSIGN_LEFTTORIGHT value
	| MOV IDENTIFIER ASSIGN_RIGHTTOLEFT value;

whileloop:
	WHILE OPEN_PAREN value CLOSE_PAREN OPEN_CURLY statement* CLOSE_CURLY;

ifloop:
	IF OPEN_PAREN value CLOSE_PAREN OPEN_CURLY statement* CLOSE_CURLY;

forloop:
	FOR OPEN_PAREN fordeclaration COMMA forcomparison COMMA foredit OPEN_CURLY statement*
		CLOSE_CURLY;

fordeclaration: num_types COLON IDENTIFIER EQUALS value;
forcomparison: value;
foredit: edit;

value: // Returns a value
	functioncall																										# calledFunctionValue
	| functionvalue																									# functionValue
	| value bytevalue																								# byteValue
	| <assoc = right>value POWER value															# powValue
	| MINUS value																										# unaryMinusValue
	| NOT value																											# notValue
	| value op = (MULTIPLY | DIVIDE | MODULO) value									# multiplicationValue
	| value op = (PLUS | MINUS) value																# additionValue
	| value op = (LESS | GREATER | LESSEQUALS | GREATEREQUALS) value# relationalValue
	| value AND value																								# andValue
	| value OR value																								# orValue
	| cast value																										# castValue
	| atom																													# atomValue;

atom: // Value of something
	OPEN_PAREN value CLOSE_PAREN									# parAtom
	| (INTEGER | FLOAT_NUMBER)										# numberAtom
	| (HEX_NUMBER | HEX_STRING)										# hexAtom
	| (BIN_NUMBER | BIN_STRING)										# binAtom
	| (OCT_NUMBER | OCT_STRING)										# octAtom
	| (DEC_NUMBER | DEC_STRING)										# decAtom
	| (TRUE | FALSE)															# boolAtom
	| IDENTIFIER																	# idAtom
	| (STRING_VALUE | CHAR_VALUE)									# stringAtom
	| NULL																				# nullAtom
	| IDENTIFIER OPEN_BRACKET value CLOSE_BRACKET	# arrayAtom;

args: value | value COMMA;

cast: OPEN_PAREN types CLOSE_PAREN value;

functionvalue:
	IDENTIFIER PERIOD IDENTIFIER
	| functionvalue PERIOD IDENTIFIER;

functioncall:
	IDENTIFIER OPEN_PAREN args* CLOSE_PAREN
	| IDENTIFIER OPEN_PAREN CLOSE_PAREN;

bytevalue: OPEN_BRACKET INTEGER COLON INTEGER CLOSE_BRACKET;

types:
	num_types
	| STRING
	| CHAR
	| VOID
	| MEOW
	| types OPEN_BRACKET CLOSE_BRACKET;

num_types: uintegers | integers | floats | longs;

uintegers: UINT8 | UINT16 | UINT32 | UINT64 | UINT128;
integers: INT8 | INT16 | INT32 | INT64 | INT128;
floats: FLOAT32 | FLOAT64;
longs: LONG | ULONG;