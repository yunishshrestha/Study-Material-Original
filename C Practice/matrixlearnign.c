//concatination of two matrices
#include<stdio.h>
int main()
{
   int row,col,i,j,mat1[10][10],mat2[10][10],sum[10][10];
   printf("Enter the number of row and column of matrix:");
   scanf("%d%d",&row,&col);
   printf("Enter the elements of first matrix:\n");
   for (i=0;i<row;i++)
   {

       for (j=0;j<col;j++)
       {

           printf("mat1[%d][%d] = ",i,j);
           scanf("%d",&mat1[i][j]);
       }
   }



printf("Enter the second matrix:\n");


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

   printf("The sum of two matrices is: \n");

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
