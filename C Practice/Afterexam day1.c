#include<stdio.h>
// square of stars

int main()
{
    int i,j,n;
    printf("Enter the number of lines:");
    scanf("%d",&n);

    for (i=0;i<n;i++)
    {
        for (j=0;j<n;j++)
        {
            printf("\t*");
        }

            printf("\n");
    }
    return 0;
}
