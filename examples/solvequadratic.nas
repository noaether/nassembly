section data {
  float : a = 1.0
  float : b = -3.0
  float : c = 2.0
}

section text {
  global main

  main {
    float[2] : solutions = solveQuadratic(a, b, c)

    mov eax <- solutions[0]
    mov solutions[1] -> ebx
  }

  solveQuadratic float,float,float->float[2] {
    float : a
    float : b
    float : c

    float : discriminant = (b * b) - (4.0 * a * c)

    float : x1 = (-b + sqrt(discriminant)) / (2.0 * a)
    float : x2 = (-b - sqrt(discriminant)) / (2.0 * a)

    float[] : solutions = [x1, x2]

    return solutions
  }
}
