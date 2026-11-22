
#include<stdio.h>
#include<math.h>
int main()
{
    float a[50],sum=0,avg,std,summation=0;
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

    for (i=0;i<n;i++)
    {
       summation = summation + pow((a[i] - avg),2);

    }

    std = pow(summation/n,0.5);
    printf("Standard = %.2f",std);





    return 0;

}
