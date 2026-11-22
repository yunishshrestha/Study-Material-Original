#include<stdio.h>
int main()
{
    int a,b,c,large;
    printf("Enter any three numbers:\n");
    scanf("%d%d%d",&a,&b,&c);
    if (a>b && a>c)
    {

        large=a;
    }
    else if (b>a && b>c);
    {
        large=b;
    }
    else
        {
        large=c;
    }
    printf("LArgest = %d",large);
    return 0;
}
