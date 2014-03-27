#include <stdio.h>
#include <stdlib.h>

int globalVar;

int addNumbers(int a, int b)
{
  int result = a + b;
  return result;
}

int substractNumbers(int a, int b)
{
  return a - b;
}

int main(int argc, char **argv) {
  int a = atoi(argv[1]);
  int b = atoi(argv[2]);

  printf("The sum of %d + %d is: %d\n", a, b, addNumbers(a, b));
  printf("The rest of %d + %d is: %d\n", a, b, substractNumbers(a, b));

  return 0;
}
