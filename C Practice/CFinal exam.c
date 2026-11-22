#include<stdio.h>
int main()
{


    int n,sum,avg;
    printf("Enter the first n numbers(n): ");
    scanf("%d",&n);
    sum=n*(n+1)/2;
    avg=sum/n;
    printf("The sum of first %d natural numbers is %d and \n The average is %d: ",n,sum,avg);
    return 0;
}
