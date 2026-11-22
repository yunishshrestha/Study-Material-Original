#include<stdio.h>
int main()
{
    float radius,area;
    printf("Enter the radius of the circle:");
    scanf("%f",&radius);
    area=3.14*radius*radius;
    printf("The area with the circle of radius %.2f = %.2f",radius,area);


    return 0;
}
