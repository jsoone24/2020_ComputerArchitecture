#include <stdio.h>

extern void bubblesort(long arr[], int index);


int main()
{
	long arr[4] = {7,3,1,2};
	int i;
		
	printf("Array before sorting :");
	for(i = 0; i < sizeof(arr)/sizeof(long); i++)
		printf(" %ld ",arr[i]);
	printf("\n");
		
	bubblesort(arr, 4);

	printf("Array after sorting :");
	for(i = 0; i < sizeof(arr)/sizeof(long); i++)
		printf(" %ld ",arr[i]);
	printf("\n");
	
	return 0;
}
