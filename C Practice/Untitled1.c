#include<stdio.h>
#include<conio.h>
int main(){
    float p, t, r, i;
    printf("Enter Principle in Rs");
    scanf("%f", &p);
    printf("Enter Time in Year");
    scanf("%f", &t);
    printf("Enter Rate in percent per anum");
    scanf("%f", &r);
    i=p*t*r/100;
    printf("The intrest is.%2f", i);
    return 0;
}

