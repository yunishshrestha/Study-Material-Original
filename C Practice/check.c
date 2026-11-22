#include <stdio.h>

int main(void) {
    int n;
    printf("Enter count of numbers: ");
    if (scanf("%d", &n) != 1 || n <= 0) {
        fprintf(stderr, "Invalid count\n");
        return 1;
    }

    double sum = 0.0;
    for (int i = 0; i < n; ++i) {
        double x;
        printf("Number %d: ", i + 1);
        if (scanf("%lf", &x) != 1) {
            fprintf(stderr, "Invalid input\n");
            return 1;
        }
        sum += x;
    }

    double avg = sum / n;
    printf("Sum = %.6f\nAverage = %.6f\n", sum, avg);
    return 0;
}