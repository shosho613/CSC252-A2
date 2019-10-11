#include <stdint.h>

int ncmp = 4;

#include <stdint.h>
uint64_t ncmp = 4;

int x(uint64_t rdi, uint64_t rsi){
    uint64_t rax = rdi;
    uint32_t edx = (uint32_t) rax; // take highest 32 bits of both parameters
    rax = rsi;
    uint32_t edx2 = (uint32_t) rax;
    rdi = rax;
    return edx2;

}

void s(uint64_t rdi, uint32_t esi){
    int x= 1;

    if(rdi > x){
        
    }


}
