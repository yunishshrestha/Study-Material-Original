#include<stdio.h>
int main()
{
    int a,b,swap;
    printf("Enter first and second number:");
    scanf("%d%d",&a,&b);
    swap=a;
    a=b;
    b=swap;
    printf("After swapping a=%d and b=%d.",a,b);

    return 0;
}
