//to print firs 50 prime numbers.....

#include<stdio.h>
int main()
{
    int i,j,num=2,prime;
    for (num=2;num<=50;num++)
    {
        for (j=2;j<num;j++)
        {
            prime=1;
            if(num%j==0)
            {
                prime=0;
            }
        }



     if(prime==1)
     {
        printf("%d\t",num);
     }
}

    return 0;
}

