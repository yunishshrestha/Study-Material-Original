#include<stdio.h>
int main()
{
    int i,a[30],n,temp;
    printf("Enter the number of elements:");
    scanf("%d",&n);

    for (i=0;i<n;i++)
    {
        printf("a[%d]=",i);
        scanf("%d",&a[i]);
    }


    for (i=0;i<n/2;i++)
    {
      temp=a[i];
      a[i]=a[n-1-i];
      a[n-1-i]=temp;
    }

    for (i=0;i<n;i++)
    {
        printf("a[%d]= %d\n",i,a[i]);


    }
    return 0;
}
