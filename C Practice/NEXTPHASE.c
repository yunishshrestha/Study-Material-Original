//to print first 50 prime numbers.

#include<stdio.h>
int main()
{
    int num=1,i,j,prime;
    for(i=2;num!=50;i++)
    {
        prime=0;
       for (j=2;j<=i/2;j++)
       {
           if(num%j==0 && num!=2)
           {
               prime=1;
               break;
           }
       }
if(prime==0)
    {
        printf("%d",num);
        printf("\t");
        num++;
    }
    }

    return 0;
}
