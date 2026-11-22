//to print firs 50 prime numbers.....

#include<stdio.h>
int main()
{
    int i=1,j,num=2,prime;
    for (num=2;i<=50;num++)
    {
        for (j=1;j<=num/2;j++)
        {
            prime=1;
            if(num%j==0 || num!=0)
            {
                prime=0;
                break;
            }
        }



     if(prime==1)
     {
        printf("%d\t",num);
        i++;
     }
}

    return 0;
}
