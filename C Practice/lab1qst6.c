#include<stdio.h>
int main()
{
    int a;
    float b;
    char c;
    char d[50];
    printf("Enter a integer, float,character and a string at last:\n");
    fflush(stdin);
    scanf("%d%f%c%c",&a,&b,&c,&d);
    printf("Integer = %d \n Float = %f \n Character = %c\n String = %c");


    return 0;
}
