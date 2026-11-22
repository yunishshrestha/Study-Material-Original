//displaying first 50 prime number
#include<stdio.h>
int main()
{
 int i,j,n=0,flag;
 printf("Displaying first 50 prime numbers\n");
 for(i=2;n!=50;i++)
 {
     flag =0;
     for(j=2;j<=i/2;j++)
     {
         if(i%j==0)
         {
             flag=1;
             break;
         }

     }
     if(flag==0)
         {
             printf("%d\t",i);
             n++;

         }
 }
 return 0;
}
