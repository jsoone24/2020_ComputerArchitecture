#include <stdio.h>

extern void quicksort(long arr[], int first, int last);


int main()
{
	long arr[8] = {5,1,4,3,2,8,7,6};
	int i, arraysize = 0;

	arraysize = sizeof(arr)/sizeof(long);
		
	printf("Array before sorting :");
	for(i = 0; i < arraysize; i++)
		printf(" %ld ",arr[i]);
	printf("\n");
		
	quicksort(arr, 0, arraysize-1);

	printf("Array after sorting :");
	for(i = 0; i < arraysize; i++)
		printf(" %ld ",arr[i]);
	printf("\n");
	
	return 0;
}
