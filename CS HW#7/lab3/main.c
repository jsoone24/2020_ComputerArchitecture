#include <stdio.h>

extern void bubblesort(int arr[], int index);


int main()
{
	int arr[4] = {7,3,1,2};
	int i;
		
	printf("Array before sorting :");
	for(i = 0; i < sizeof(arr)/sizeof(int); i++)
		printf(" %d ",arr[i]);
	printf("\n");
		
	bubblesort(arr, 4);

	printf("Array after sorting :");
	for(i = 0; i < sizeof(arr)/sizeof(int); i++)
		printf(" %d ",arr[i]);
	printf("\n");
	
	return 0;
}
