#include<stdio.h>
#include<stdlib.h>
int main()
{
    FILE *fptr;
    char name[50], address[100],ch;
    int age;
    fptr = fopen("student.txt","w+");
    if(fptr == NULL)
    {
        printf("File is corrupted\n");
        exit(1);
    }
    printf("Enter the Name, Age, Address of a student\n");
    fprintf(fptr,"Your Student record\n");
    printf("Name= ");
    gets(name);
    printf("Age= ");
    scanf("%d",&age);
    printf("Address= ");
    fflush(stdin);
    gets(address);
    fprintf(fptr,"Name =%s\nAge = %d\nAddress = %s",name,age,address);
    rewind(fptr);
    printf("Reading from file\n");
    do
    {
       ch = fgetc(fptr);
       putchar(ch);
    }while(ch!=EOF);
    printf("\n---------- File executed successfully ------------\n");
    fclose(fptr);
    return 0;
}
