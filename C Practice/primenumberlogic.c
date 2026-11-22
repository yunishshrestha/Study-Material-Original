#include<stdio.h>
int main()
{
    int num,prime=1,i;
    printf("Enter a number:");
    scanf("%d",&num);
    if(num<=1 )
    {
        prime=0;
    }
    else
    {

        for(i=2;i<=num/2;i++)
        {

            if(num%i==0)
            {
                prime=0;
                break;

            }

        }
    }
    if(prime==1)
    {
        printf("The number %d is a prime number.",num);
    }
    else
    {
        printf("The number %d is not a prime number.",num);
    }

    return 0;
}
