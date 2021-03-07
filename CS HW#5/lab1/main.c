#include <stdio.h>

extern int factorial(int num);
extern int factRecursive(int num);

int main(void){
			
	int facnum = 6;	
	int result = 0;
	
	printf("Before: %d\n",result);

	result = factorial(facnum);
	
	printf("After: %d\n",result);
	
	return 0;

}

