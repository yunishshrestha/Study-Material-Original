/* tofind the  first n odd or even numbers and their sums..
*/

#include<stdio.h>
int main()
{
    int n,i,esum=0,osum=0,count;
    printf("Enter the number of first n numbers:");

    scanf("%d",&n);
     printf("The first %d even numbers are:\n",n);
     count=1;
     for (i=1;count<=n;i++)
        {
            if(i%2==0)
            {
               printf("%d\t",i);
               esum=esum+i;
               count++;
            }
printf("\n");

        }

         printf("The first %d odd numbers are:\n",n);

         count=1;
        for (i=1;count<=n;i++)
        {
           if(i%2!=0)
                {

                printf("%d\t",i);
                osum=osum+i;
                count++;
            }
            printf("\n");
        }
        printf("The sum of first %d even numbers is %d.",n,esum);
        printf("The sum of first %d odd numbers is %d.",n,osum);

    return 0;
}

