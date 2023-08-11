section data { ; constants
  uint32 : value1 = 0xCAFEBEBE
  uint32 : value2 = hex CAFEBEBE ; Same as value1
  uint32 : value3 = 0b11001010111111101011111010111110
  uint32 : value4 = bin 11001010111111101011111010111110
}

section text {
  global main

  main {
    uint64 : total = (value1 + value2 + value3 + value4) ; when a variable isn't assigned directly, the value should be in parentheses
    uint64 : total2 = add2_64((uint64) value1, (uint64) value2) ; a function's return value can be used as a value, only if the function's return type exactly matches the variable's type
    uint32[] : array = [value1, value2, value3, value4] ; an array is represented by its values' type, and if you add a something that isn't the same type without casting it
    ; like `(uint32) 8`, it will throw, get pissed, throw a fit and then blow up your computer <3
    uint128 : total128 = addArray(array)

    mov ax <- main.total

    ;[
    mov ax <- main.total2
    mov cx <- ax

    mov ax <- main.total128
    mov dx <- ax

    both of these will throw, since a register can only hold 32 bits
    you should use this instead:
    ];

    mov bx <- main.total2[0:32] ; first 32 bits
    mov cx <- main.total2[32:64] ; second 32 bits
    mov dx <- main.total2[16:48] ; this works too

    mov dx <- main.total128[0:32] ; first 32 bits
    mov cx <- main.total128[32:64] ; second 32 bits
    mov bx <- main.total128[64:96] ; third 32 bits
    mov ax <- main.total128[96:128] ; fourth 32 bits

    float : pi = getPi()
    float : e = 2.71828

    float : result = (pi * e)
    uint32 : resultWhole = (uint32) result
    uint32 : resultFraction = (uint32) result.decimals
  } ; the closing brace of main means everything went correctly. error handling should be taken care of by the actual code, or main will return a noerror value

  getPi void->float {
    float : pi = 3.14159
    return pi
  } ; takes in no arguments, returns a float

  add2_64 uint64,uint64->uint64 {
    uint64 : c = 0 ; not an argument (but not good practice)
    uint64 : a ; First variables with same type & no values are arguments
    uint64 : b ; First variables with same type & no values are arguments

    ; `uint64 : c = 0` should be here instead
    uint64 : added = (a + b)
    return added ; return can only return a variable
  } ; takes in uint64 (x2), returns uint64

  addArray uint32[]->uint128 {
    uint32[] : array ; First variables with same type & no values are arguments
    uint128 : sum = 0 ; declared as 0, which is good practice to avoid getting it mixed with args
    uint32 : i = 0 ; same ^                                                                     ^
    while (i < array.length) {
      sum += array[i]
      i++
    }
    return sum
  } ; takes an array of uint32, returns uint128

  Wilodier void->meow {
    ??? ; TODO: figure out how to make a meow
    return meow
  } ; takes in no arguments, returns a meow
}

;[BLOCK COMMENTS THAT CAN
GO OVER MULTIPLE LINES];
