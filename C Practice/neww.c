#include<stdio.h>
int main()
{
    int num=0,i,j,prime;
    for(i=2;num!=50;i++)
    {
        prime=0;
       for (j=2;j<=i/2;j++)
       {
           if(i%j==0)
           {
               prime=1;
               break;
           }
       }
if(prime==0)
    {
        printf("%d",i);
        printf("\t");
        num++;
    }
    }
 return 0;
}
