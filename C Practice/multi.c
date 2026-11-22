
#include<stdio.h>
int main()
{
    float m[10][10], n[10][10], mul[10][10];
    int i, j, row, col;

    printf("Enter the number of rows and columns for the working matrix respectively\n");
    scanf("%d%d", &row1, &col1,&row2,&col2);

    printf("\nEnter the matrix elements:\n");
    for (i = 0; i < row1; i++) {
        for (j = 0; j < col1; j++) {
            printf("a[%d][%d]=", i, j);
            scanf("%f", &m[i][j]);
        }
    }

    printf("\nEnter the matrix elements for the second matrix:\n");
    for (i = 0; i < row2; i++) {
        for (j = 0; j < col2; j++) {
            printf("a[%d][%d]=", i, j);
            scanf("%f", &n[i][j]);
        }
    }

    // multiplying the two matrices
    for (i = 0; i < row1; i++) {
        for (j = 0; j < col2; j++) {
            mul[i][j] = m[i][j] * n[i][j];
        }
    }

    // Print the resulting matrix
    printf("\nThe product of the two matrices is:\n");
    for (i = 0; i < row; i++) {
        for (j = 0; j < col; j++) {
            printf("%.2f\t", mul[i][j]);
        }
        printf("\n");
    }

    return 0;
}
