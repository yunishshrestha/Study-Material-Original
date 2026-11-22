#include<stdio.h>
int main()
{
    char m[5][70];
    int i;
    for (i=0;i<5;i++)
    {
        printf("Enter string m[%d]:\n",i);
        gets(m[i]);
    }
    printf("The entered strings are:\n");
    for (i=0;i<5;i++)
    {
        printf("%s\n",m[i]);
    }

    return 0;
}
