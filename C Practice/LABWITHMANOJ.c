#include<stdio.h>
int main()
{
    int i,j,n=1,flag=0;
    printf("The first 50 prime numbers are :");


        for (i=2;n!=100;i++)
        {
            flag=0;
            for (j=2;j<=i/2;j++)
            {
                if (i%j==0){
                flag=1;

                break;
                }

            }
            if(flag==0)
            {
                printf("%d\t\n",i);
                n++;
            }
        }

    return 0;
}
