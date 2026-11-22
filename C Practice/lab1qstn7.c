
#include<stdio.h>
int main()
{
    int num1,num2,rem;
    printf("Enter first number to be divided:");
    scanf("%d",&num1);
    printf("Enter second number that divides the first number:");
    scanf("%d",&num2);
    rem=num1%num2;
    printf("The remainder = %d",rem);


    return 0;
}
