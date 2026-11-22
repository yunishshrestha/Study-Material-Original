#include <stdio.h>

int main() {
    int n, i, j;
    float matrix[10][10], transpose[10][10];

    // Input the order of the square matrix
    printf("Enter the order of the square matrix (n x n): ");
    scanf("%d", &n);

    // Input the elements of the matrix
    printf("Enter the elements of the matrix:\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            printf("matrix[%d][%d]: ", i, j);
            scanf("%f", &matrix[i][j]);
        }
    }

    // Transpose the matrix
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            transpose[j][i] = matrix[i][j];
        }
    }

    // Display the original matrix
    printf("\nOriginal Matrix:\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            printf("%.2f\t", matrix[i][j]);
        }
        printf("\n");
    }

    // Display the transposed matrix
    printf("\nTransposed Matrix:\n");
    for (i = 0; i < n; i++) {
        for (j = 0; j < n; j++) {
            printf("%.2f\t", transpose[i][j]);
        }
        printf("\n");
    }

    return 0;
}
