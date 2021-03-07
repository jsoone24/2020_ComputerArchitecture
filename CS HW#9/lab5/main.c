#include <stdio.h>
#include <stdlib.h>

extern void matrix(int **A, int **B, int **C, int *D);

int main(){
	int i = 0, j = 0, k = 0 ; //initialize variables
	int Array_Size[3];
	int idx = 0;
	int **A;
	int **B;
	int **C; 
	
	printf("input values of s, u, v: "); //get s, u, v value
	while(idx<3){
		Array_Size[idx] = getchar() - '0';
		idx++;
	}	
	
	A = (int**)malloc(sizeof(int)*Array_Size[0]); //allocate memeory space to array A
	for(idx = 0;idx<Array_Size[0];idx++)
	{
		A[idx] = (int*)malloc(sizeof(int) * Array_Size[1]);
	}
	
	B = (int**)malloc(sizeof(int)*Array_Size[1]); //allocate memeory space to array B
	for(idx = 0;idx<Array_Size[1];idx++)
	{
		B[idx] = (int*)malloc(sizeof(int) * Array_Size[2]);
	}


	C = (int**)malloc(sizeof(int)*Array_Size[0]); //allocate memeory space to array C
	for(idx = 0;idx<Array_Size[0];idx++)
	{
		C[idx] = (int*)malloc(sizeof(int) * Array_Size[2]);
	}


	printf("This is %d by %d matrix version \n", Array_Size[0], Array_Size[2]);
		
	printf("\nInput value of A : "); //get value of Matrix A
	for(i=0; i < Array_Size[0]; i++){
		for(j=0; j < Array_Size[1]; j++){
			scanf("%d", &A[i][j]);
		}
	}
	j=0; i=0;
	getchar();
		
	printf("\nInput value of B : "); //get value of Matrix B
	for(j=0; j < Array_Size[1]; j++){
		for(k=0; k < Array_Size[2]; k++){       
			scanf("%d", &B[j][k]);
		}
	}
	k=0; j=0;	
		
	printf("\nArray A \n"); //print Matrix A
	for(i=0; i < Array_Size[0]; i++){
		for(j=0; j < Array_Size[1]; j++){  
		printf("%d ",A[i][j]);
		}
		printf("\n");	
	}
	i=0;
	j=0;
		
	printf("Array B \n"); //print Matrix B
	for(j=0; j < Array_Size[1]; j++){
		for(k=0; k < Array_Size[2]; k++){  
		printf("%d ",B[j][k]);
		}
		printf("\n");	
	}
	j=0;
	k=0;
				
	matrix(A, B, C, Array_Size); //Calculate Matrix Manipulation
		
	printf("Array C after Operating : \n"); //Print Matrix C
	for(i=0; i < Array_Size[0]; i++){
		for(k=0; k < Array_Size[2]; k++){  
		printf("%d ",C[i][k]);
		}
		printf("\n");	
	}
	free(A); //deallocate Memories
	free(B);
	free(C);
	
	return 0;
}
