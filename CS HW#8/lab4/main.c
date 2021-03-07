#include <stdio.h>

/* Don't modify */
#define TEST_ADDR1 0xf6fff07c
//#define TEST_ADDR2 0xf6fff180
#define TEST_ADDR2 0xf6ffeb50
#define TEST_PATTERN 0x00000000
/*********************************/

extern int memory_size_check(unsigned int, unsigned int);
extern int pattern_search(unsigned int, unsigned int, unsigned int);
extern void top1_pattern_search(unsigned int, unsigned int, unsigned int, int *);

void example1(void);
void example2(void);
void example3(void);

int main(void)
{
	example1();
	example2();
	example3();

	return 0;
}

void example1(void)
{
	int result = 0;

	result = memory_size_check(TEST_ADDR1, TEST_ADDR1 + (1 << 9));

	printf("check array size: %d\n", result);
}

void example2(void)
{
	int result = 0;

	result = pattern_search(TEST_ADDR2, TEST_ADDR2 + (1 << 9), TEST_PATTERN);

	printf("pattern count: %d\n", result);
}

void example3(void)
{
	int result[6];

	top1_pattern_search(TEST_ADDR2, TEST_ADDR2 + (1 << 9), 0, result);

	printf("Top1 pattern: 0x%04x\n", result[0]);
	printf("Top1 pattern count: %d\n", result[1]);
	printf("Top2 pattern: 0x%04x\n", result[2]);
	printf("Top2 pattern count: %d\n", result[3]);
	printf("Top3 pattern: 0x%04x\n", result[4]);
	printf("Top3 pattern count: %d\n", result[5]);
}

