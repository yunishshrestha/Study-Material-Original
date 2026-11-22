#include<stdio.h>
int main()
{
    float a[50],sum=0,avg;
    int n,i;
    printf("Enter the number of elements:");
    scanf("%d",&n);
    printf("Enter array elements:");
    for (i=0;i<n;i++)
    {

        printf("\na[%d]= ",i);
        scanf("%f",&a[i]);

    }

    for (i=0;i<n;i++)
    {
        sum=sum+a[i];

    }

    avg=sum/n;

    printf("The sum of the elements of the array = %.2f and the average = %f",sum,avg);

    return 0;

}
