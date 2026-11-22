#include<stdio.h>
int main()
{
    int i,j,k,row,col,col2;
    float a[10][10],b[10][10],mul[10][10];
    printf("Enter the row and column of 1st matrix\n");
    printf("Row= ");
    scanf("%d",&row);
    printf("Column= ");
    scanf("%d",&col);
    printf("Enter the 1st matrix\n");
    for(i=0;i<row;i++)
    {
        for(j=0;j<col;j++)
        {
            printf("a[%d][%d]= ",i,j);
            scanf("%f",&a[i][j]);
        }
    }
    printf("Note: For Matrix Multiplication\nColumn of First matrix must be equal to row of second matrix\n");
    printf("Give column of second matrix\n");
    scanf("%d",&col2);
    printf("Enter the second matrix\n");
    for(i=0;i<col;i++)
    {
        for(j=0;j<col2;j++)
        {
            printf("b[%d][%d]= ",i,j);
            scanf("%f",&b[i][j]);
        }
    }
    //for matrix multiplication
    for(i=0;i<row;i++)
    {
        for(j=0;j<col2;j++)
        {
            mul[i][j]=0;
            for(k=0;k<col;k++)
            {
                mul[i][j]+=a[i][k]*b[k][j];
            }
        }
    }
    printf("The final matrix is \n");
    for(i=0;i<row;i++)
    {
        for(j=0;j<col2;j++)
        {
            printf("%.2f\t",mul[i][j]);
        }
        printf("\n");
    }
    return 0;

}
