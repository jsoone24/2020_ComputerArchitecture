#include <stdio.h>
#include <stdlib.h>

extern void matrix(int (*A)[], int (*B)[], int (*C)[], int index);

int main(){
	int index=3 ; 
	int i = 0 ;
	int j = 0 ;
	int k = 0 ;
	int A[3][3] ;
	int B[3][3] ;
	int C[3][3] ;	
	

	printf("This is 3 by 3 matrix version \n");
		
	printf("\nInput value of A : ");
	for(i=0; i < index; i++){
		for(j=0; j < index; j++){       
			A[i][j] = getchar()-'0';
		}
	}
	j=0; i=0;
	getchar();
		
	printf("\nInput value of B : ");
	for(j=0; j < index; j++){
		for(k=0; k < index; k++){       
			B[j][k] = getchar()-'0';
		}
	}
	k=0; j=0;	
		
	printf("\nArray A \n");
	for(i=0; i < index; i++){
		for(j=0; j < index; j++){  
		printf("%d ",A[i][j]);
		}
		printf("\n");	
	}
	i=0;
	j=0;
		
	printf("Array B \n");
	for(j=0; j < index; j++){
		for(k=0; k < index; k++){   
		printf("%d ",B[j][k]);
		}
		printf("\n");	
	}
	j=0;
	k=0;
				
	matrix( A, B, C, index);
		
	printf("Array C after Operating : \n");
	for(i=0; i < index; i++){
		for(k=0; k < index; k++){  
		printf("%d ",C[i][k]);
		}
		printf("\n");	
	}
	
	return 0;
}
