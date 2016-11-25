// GroupID-65 (15114063_15114027) - Sandeep Pal & Gautam Choudhary
// Date: November 2, 2016
// gp_sum.c The program takes input the first term, common ratio and
//			  number of terms of GP and prints the SUM of GP
#include <stdio.h>

int main(){
   // Defining the Variables
	/** n - Number of terms
	** f - First term of GP
	** r - Common Ratio of GP
	*/
	int f, r, n;

   // Taking input from the User (in order)	
	printf("Enter 'First' term of GP, f:   ");
	scanf("%d", &f);

	printf("Enter 'Common Ratio' of GP, r: ");
	scanf("%d", &r);

	printf("Enter the number of terms, n:  ");
	scanf("%d", &n);


   // Temporary Variables
	int term = f;
	int sum = 0;
	int i;

   // Algorithm to calculate SUM of N terms of a GP
	for(i=0; i<n; i++){
		sum = sum + term;
		term = term*r ;
	}

   // Print the OUTPUT i.e. SUM
	printf("The sum of GP is: %d\n", sum);

	
	return 0;
}