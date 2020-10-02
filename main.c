#include <stdio.h>
#include <stdint.h>

long int manager();

int main(){
  long int result_code = -999;
  printf("%s", "Welcome\n");
  result_code = manager();
  printf("%s%ld%s\n", "Main received, ", result_code, "and exiting with result code 0.\n");
  return 0;
}
