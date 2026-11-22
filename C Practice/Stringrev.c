#include<stdio.h>
int main()
{
    int i,temp,len=0;
    char m[10];
    printf ("enter a string:\n");
    gets(m);

     for (i=0;m[i]!='\0';i++)
     {
         len++;
     }

    // to  yunish, 012345
    // a=b, t=a,a=b,b=t

     for (i=0;i<len/2;i++)

     {
         temp=m[i];
         m[i]=m[len-1-i];
         m[len-1-i]=temp;

     }

     printf("%s",m);
    return 0;
}
