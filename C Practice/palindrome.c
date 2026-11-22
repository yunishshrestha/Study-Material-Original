#include<stdio.h>
typedef struct{
int roll_no;
char name[50];
}student;
int main()
{
student record;
printf("Enter record of student\n");
printf("Enter student's name\n");
gets(record.name);
printf("Enter student's roll no\n");
scanf("%d",&record.roll_no);
printf("Record you entered\n");
printf("Name = %s\nRoll no. = %d",record.name,record.roll_no);
return 0;
}
