#include <stdint.h>
#include <stdio.h>
#include <stdio.h>

int ncmp = 4;

void x(int *a, int *b) {
	int tmp = *a;
	*a = *b;
	*b = tmp;
}

int s(int *a, int b) {
	int eax = 1;
	while (eax < b) {
		int rax = eax;
		while (rax > 0) {
			if ((unsigned int) a[rax-1] < (unsigned int) a[rax]) {
				x(&a[rax], &a[rax-1]);
				
				rax--;
			} else
				break;
		}
        ncmp++;
		eax++;
	}
    ncmp--;
	return eax;
}
