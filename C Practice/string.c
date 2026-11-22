#include<Stdio.h>
int main()
{
    char strings[100];
    printf("Enter a string:\n");
    gets(strings);
    int i,l=0,n;
    for (i=0;strings[i]!='\0';i++)
    {
        l++;
    }
    printf("The length of the string is %d",l);

    return 0;
}
