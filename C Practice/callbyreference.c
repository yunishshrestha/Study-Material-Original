#include<stdio.h>
void swap(float *x, float *y);
int main()
{
    float a,b;
    printf("Enter a and b: \n");
    scanf("%f%f",&a,&b);
    swap(&a,&b);
    printf("The number after swapping is\n a=%f \t b=%f",a,b);

    return;
}

void swap(float *x, float *y)
{
    *x=*x+*y
}
