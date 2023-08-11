# HowTo nassembly

## File structure

```nass
section data {
  ; Constant variables and data, type and value cannot change
}

section text {
  global main

  main {
    ; main function
  }

  ; declare other functions here
}
```

## Variables and data

See [#functions](#functions) for more information about values that depend on functions. \
See [#datatypes](#data-types) for more information about datatypes.

```nass
; [type] : [name] = [value]
uint32 : a = 0x12345678 ; Constants, can be placed in data
uint32 : b = 0x87654321 ; ^                              ^

uint32 : c = function() ; Function call, cannot be placed in data
uint32 : d = function(0x12345678, 0x87654321) ; Function call with arguments
uint32 : e = (0x10101010 + 0x01010101) ; Mathematical operations should be placed in parentheses
```

## Data types

### Integer types

- `uint8` - Unsigned 8-bit integer
- `uint16` - Unsigned 16-bit integer
- `uint32` - Unsigned 32-bit integer
- `uint64` - Unsigned 64-bit integer

- `int8` - Signed 8-bit integer
- `int16` - Signed 16-bit integer
- `int32` - Signed 32-bit integer
- `int64` - Signed 64-bit integer

- `float32` - 32-bit floating point number
- `float64` - 64-bit floating point number

- `long` - 32-bit integer on 32-bit systems, 64-bit integer on 64-bit systems
- `ulong` - 32-bit unsigned integer on 32-bit systems, 64-bit unsigned integer on 64-bit systems

### String types

- `char` - Single character

- `string` - String of characters
- `cstring` - String of characters terminated by a null byte

### Boolean type

- `bool` - Boolean value, can be `true` or `false`

### Pointer types

- `ptr` - Pointer to any type

### Other types

- `void` - No type, used for functions that do not return a value
- `null` - Null pointer

## Functions

In a function declaration, the first two variables that are not initialized are the arguments. Even if possible, you should not declare variables with values before having declared all the arguments.

Important info :

- `return` can only return a variable, not a value
- `return` can only be used once in a function

```nass
; [name] [arg1_type, arg2_type, ...]->[return_type] {}

getPi void->float {
  float : pi = 3.14159
  return pi
}

add2_64 uint64,uint64->uint64 {
  uint64 : c = 0 ; not an argument (but not good practice)
  uint64 : a ; First variables with same type & no values are arguments
  uint64 : b ; First variables with same type & no values are arguments

  ; `uint64 : c = 0` should be here instead for good practice
  uint64 : added = (a + b)
  return added ; return can only return a variable
} ; takes in uint64 (x2), returns uint64
```

## Comments

Don't forget to put a space after the semicolon for the single line comments. You don't have to but it looks better that way.

```nass
; Single line comment
;\[ Single line comment (Lbracket escaped)
;[ Single line comment ]; *NOT A COMMENT HERE*

;[
  Multi
  line
  comment
];
```