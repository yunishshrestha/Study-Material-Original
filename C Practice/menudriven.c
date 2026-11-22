//to write a men>u driven program for orr or even,factorial and exit
#include<stdio.h>
int main()
{

    int kase,num,fact=1,i,numm;
    do
    {

    printf("Enter 1 to find Odd or Even\nEnter 2 to find the factorial of a given number\nEnter 3 to EXIT:\n");
    scanf("%d",&kase);


    switch (kase)
    {
        case 1: printf("You have chosen to find whether a given number is odd or even.\n");
        printf("Enter a number:");
        scanf("%d",&num);
        if(num%2==0)
        {
            printf("The number is an Even number.\n");
        }
        else
        {
            printf("It is an odd number.\n");
        }
        break;

        case 2: printf("You have chosen to find the factorial of a number.\n");
        printf("Enter a number:\n");
        scanf("%d",&numm);
        for (i=1;i<=numm;i++)
        {
            fact=fact*i;
        }
        printf("%d\n",fact);
        break;

        case 3:printf("You have chosen to exit the program!!!....\n");
        break;
        default: printf("Invalid INPUT.....\n");
    }
    }
    while (kase!=3);

    return 0;
}
