//Write a program to transpose
#include<stdio.h>
int main()
{
    int a[10][10],row,col,i,j,temp[10][10];
    printf("Enter the number of rows and columns:\n");
    scanf("%d%d",&row,&col);
    printf("Enter the matrix elements of matrix:\n");

    for(i=0;i<row;i++)
    {
        for (j=0;j<col;j++)
        {
            printf("a[%d][%d]= ",i,j);
            scanf("%d",&a[i][j]);
        }
    }

     for(i=0;i<row;i++)
    {
        for (j=0;j<col;j++)
        {
            temp[j][i]=a[i][j];
        }
    }
    printf("The transpose of the  matricx a is:\n");

     for(i=0;i<col;i++)
    {
        for (j=0;j<row;j++)
        {
          printf("%d\t",temp[i][j]);
        }
        printf("\n");
    }



    return 0;
}
