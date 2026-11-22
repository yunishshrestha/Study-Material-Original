// adding two matrices

#include<stdio.h>
int main()
{
    int mat1[10][10],mat2[10][10],sum[10][10],i,j,row,col;
    printf("Enter the row and col of the matrices:\n");
    scanf("%d%d",&row,&col);

    printf("Enter the Matrix First:\n");

    for (i=0;i<row;i++)
    {
        for (j=0;j<col;j++)
        {
            printf("mat1[%d][%d]= ",i,j);
            scanf("%d",&mat1[i][j]);
        }
    }

    printf("Enter the Matrix Second:\n");

    for (i=0;i<row;i++)
    {
        for (j=0;j<col;j++)
        {
            printf("mat2[%d][%d]= ",i,j);
            scanf("%d",&mat2[i][j]);
        }
    }

     for (i=0;i<row;i++)
    {
        for (j=0;j<col;j++)
        {
            sum[i][j]=mat1[i][j]+mat2[i][j];
        }
    }

    printf("The sum of two matrices is :\n");

   for (i=0;i<row;i++)
    {
        for (j=0;j<col;j++)
        {
           printf("%d\t",sum[i][j]);
        }
        printf("\n");
    }


    return 0;
}
