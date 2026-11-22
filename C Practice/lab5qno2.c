#include<stdio.h>
int main()
{
    float a[100],sum=0,avg;
    int i,n;
    printf("Enter the no. of array you want the sum and avg of\n");
    scanf("%d",&n);
    //reading array
    printf("Give %d array\n",n);
    for(i=0;i<n;i++)
    {
        printf("a[%d]= ",i);
        scanf("%f",&a[i]);
    }
    //sum of all given array
    for(i=0;i<n;i++)
    {
        sum+=a[i];
    }
    avg = sum/n;
    printf("The sum of given array = %f\nThe average of given array = %f",sum,avg);
    return 0;

}
