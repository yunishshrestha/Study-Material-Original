#include<stdio.h>
int main()
{
    float m[10][10], n[10][10], sum[10][10];
    int i, j, row, col;

    printf("Enter the number of rows and columns for the working matrix respectively\n");
    scanf("%d%d", &row, &col);

    printf("\nEnter the matrix elements:\n");
    for (i = 0; i < row; i++) {
        for (j = 0; j < col; j++) {
            printf("a[%d][%d]=", i, j);
            scanf("%f", &m[i][j]);
        }
    }

    printf("\nEnter the matrix elements for the second matrix:\n");
    for (i = 0; i < row; i++) {
        for (j = 0; j < col; j++) {
            printf("a[%d][%d]=", i, j);
            scanf("%f", &n[i][j]);
        } 
    }

    // Add the two matrices
    for (i = 0; i < row; i++) {
        for (j = 0; j < col; j++) {
            sum[i][j] = m[i][j] + n[i][j];
        }
    }

    // Print the resulting matrix
    printf("\nThe sum of the two matrices is:\n");
    for (i = 0; i < row; i++) {
        for (j = 0; j < col; j++) {
            printf("%.2f\t", sum[i][j]);
        }
        printf("\n");
    }

    return 0;
}
