#include <stdint.h>
// b = %rdi/ rbp - 24, n = %esi/ rbp - 28
int* gp(int* arr,int n){
   int a = 0; //local var at rbp - 12
   int b = 0; //local var at rbp - 16;
   int* rax = arr;
   //something about setting adress of rax to two
   a =1;
   int c = 3; //local var at rbp - 4;
   //goto L2
   int eax = a;
   if(eax >= n){
       return rax;
   }
   else{return 0;}



}
