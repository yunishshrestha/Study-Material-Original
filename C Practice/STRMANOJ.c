#include<stdio.h>
#include<stdlib.h>

typedef struct {
char name[90],ch;
int roll;
} records;

int main()
{
    FILE *fptr;
    int i;
    records s[5];
    fptr=fopen("ManojSolti.txt","w+");
    if (fptr==NULL)
    {
        printf("RANDI JASTO VAYO YAAAR\n");
        exit(1);
    }
    for (i=0;i<5;i++)
    {
    printf("Student number[%d]:\n",i+1);
    fprintf(fptr,"Student number[%d]:\n",i+1);
    printf("Enter the name:\n");
    fflush(stdin);
    gets(s[i].name);
    fflush(stdin);
    fprintf(fptr,"Name:%s\n",s[i].name);
    printf("Enter the roll no:\n");
fflush(stdin);
    scanf("%d",&s[i].roll);
    fflush(stdin);
    fprintf(fptr,"Roll:%d\n",s[i].roll);
    }
    rewind(fptr);


    printf("\nREADING FROM FILE:\n");
    while (ch!= EOF)
        {
           ch = fgetc(fptr);
        putchar(ch);
    }

    printf("\nFile Executed Successfully.\n");

    fclose(fptr);

    return 0;
}
    fclose(fptr);
    return 0;
}
