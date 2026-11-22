#include<stdio.h>
int main()
{
    int a[10],i,n;
    printf("Enter the number of array you want to give\n");
    scanf("%d",&n);
    // reading array from the user
    for (i=0;i<n;i++)
    {
        printf("a[%d]= ",i);
        scanf("%d",&a[i]);
    }

    //displaying array

    for (i=0;i<n;i++)
    {

        printf("\na[%d]= %d",i,a[i]);
    }

    return 0;
}
