#include<stdio.h>
typedef struct
{
    char name[50];
    int roll;
} student;

int main()
{
    student s;
    printf("Enter the name of the student:\n");
    gets(s.name);
    printf("Enter the roll number of the student:\n");
    scanf("%d",&s.roll);
    printf("The name of the student with roll number %d is %s",s[i].roll,s[i].name);
    return 0;
}
