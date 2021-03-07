#include <stdio.h>

void example1();
void example2();
void example4();
extern void example3();

int main (void)
{
	/* lab 2.
	 * Write down the function to test and compile
	 */

	example1();

	return 0;
}

void example1()
{
	int a;
	int *ptr;

	ptr = &a;

	*ptr = 9;

	a = 3;
/*
	int b;
	int *ptr1;

	ptr1 = &b;
	*ptr1 = 16;

	b = 256; 
*/
}

void example2()
{
	char mem[40] = {0, };
	char *a;
	int *b;
	long long *c;
	int i;

	a = (char*)mem;
	for (i = 0; i < 3; i++)
	{
		*(a + i) = 10;
	}

	b = (int*)(mem + 4);
	for (i = 0; i < 3; i++)
	{
		*(b + i) = 1;;
	}

	c = (long long*)(mem + 16);
	for (i = 0; i < 3; i++)
	{
		*(c + i) = 12;
	}

}


void example4()
{
	int buf[5] = {0, };
	int i = 0;

	printf("\nInput buffer value: ");
	while (i < 10)
	{
		buf[i] = getchar() - '0';
		i++;
	}

	printf("\nPrint array: ");
	for (i = 0; i < sizeof(buf)/sizeof(int); i++)
	{
		printf("%d ", buf[i]);
	}
	
	printf("\n");
}
