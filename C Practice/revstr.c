#include<Stdio.h>
int main()
{
    char name[50],temp;
    int i,len=0;
    printf("Enter a string:\n");
    gets(name);

    for (i=0;name[i]!='\0';i++)
    {
        len++;
    }

    // 0 1 2 3 4 5,  5=0,4=1,3=2, and so on wala comparison nikalnu paryo

    for (i=0;i<len/2;i++)
    {
        temp=name[i];
        name[i]=name[len-i-1];
        name[len-i-1]=temp;

    }

    printf("The reversed string is \t %s",name);
        return 0;
}
