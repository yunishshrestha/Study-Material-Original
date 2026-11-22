#include<stdio.h>
int main()
{
    float m[10][10],n[10][10],sum[10][10];
    int i,j,row1,col1;

    printf("Enter the number of rows and coloumns for the working matrix respectively\n");
    scanf("%d%d",&row1,&col1);

    printf("\nEnter the matrix elements:\n");
    for(i=0;i<row1;i++)
    {
        for (j=0;j<col1;j++)
    {
        printf("a[%d][%d]=",i,j);
        scanf("%f",&m[i][j]);
    }
    }


    printf("\nEnter the matrix elements for second matrix:\n");
    for(i=0;i<row1;i++)
    {
        for (j=0;j<col1;j++)
    {
        printf("a[%d][%d]=",i,j);
        scanf("%f",&n[i][j]);
    }
    }
    //now add the two matrices


    for (i=0;i<row1;i++)
    {
        for (j=0;j<col1;j++)
        {
         sum[i][j]=m[i][j]+n[i][j];
        }

    }
    printf("\nThe sum of the two matrices is :\n");

     for (i=0;i<row1;i++)
    {
        for (j=0;j<col1;j++)
        {
            printf("%.2f\t",sum[i][j]);
        }
        printf("\n");
    }

    return 0;

}









