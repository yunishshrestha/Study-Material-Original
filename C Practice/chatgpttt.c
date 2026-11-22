
#include<stdio.h>
int main()
{
    int num,prime,i;
    printf("Enter a number: ");
    scanf("%d",&num);
    if(num<=1)
    {
        printf("The number %d is not a prime number:",num);
    }
    for(i=2;i<=num/2;i++)
    {
        prime=num%i;
        break;
    }
    if(prime!=0)
    {
        printf("The number %d is a prime number: ",num);
    }
    else
    {

        printf("The number %d is not a prime number: ",num);
    }




    return 0;
}
