#include<stdio.h>
int fibo(int x,int y);
int main()
{
    int a[100],i,n;
    printf("Enter the number of series:");
    scanf("%d",&n);
    a[0]=1;
    a[1]=1;
     for (i=2;i<n;i++)
     {
         a[i]=fibo(a[i-2],a[i-1]);

     }
     for (i=0;i<n;i++)
     {
         printf("%d\t",a[i]);
     }



    return 0;
}

fibo(int x,int y)
{
    return x+y;
}

