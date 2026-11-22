// a program to print the largest among 3 numbers.
#include <stdio.h>
int main()
{
    int a,b,c,large;
    printf("Enter the value of a,b,c: ");
    scanf("%d%d%d",&a,&b,&c);
    large=a;
    if (b>large && b>c)
    {
        large=b;

    }
    if (c>large && c>b)
    {
        large=c;
    }
printf("The largest is %d",large);

    return 0;
}
