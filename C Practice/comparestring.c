#include<stdio.h>
int main()
{
    int i,j,len1=0,len2=0,flag=0;
    char m[30],n[30];
    printf("Enter a string:\n");
    gets(m);
    printf("Enter second string:\n");
    gets(n);

    for(i=0; m[i]!='\0';i++)
    {
        len1++;
    }
    for(i=0; n[i]!='\0';i++)
    {
        len2++;
    }

    if (len1!=len2)
    {
       printf("The Strings are not same and not equal.\n");
    }

    else
    {
        for (i=0;m[i]!='\0'&&n[i]!='\0';i++)
        {
            if (m[i]=n[i])
            {
                flag=1;
            }
        }
    }

    if (flag==1)
    {
        printf("Same and equal\n");
    }
    else
    {
        printf("Not same and equal");
    }
    return 0;
}
