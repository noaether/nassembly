section text {
  global main

  main {
    uint32 : n = 10 ; Calculate Fibonacci sequence up to the 10th term
    uint32 : a = 0
    uint32 : b = 1
    uint32 : temp

    mov eax <- a ; Initialize eax with the first term

    while (n > 1) {
      temp = b
      b += a
      a = temp
      n--
    }

    mov eax <- b ; Store the result in eax
  }
}

;[
  Move nth term of the Fibonacci sequence into eax
];
