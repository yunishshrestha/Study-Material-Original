//FILE HANDLING> WRITE ON FILE AND READ FROM IT.
#include<stdio.h>
#include<stdlib.h>
int main()
{
    FILE *fptr;
    char ch,str;
    int i;

    fptr=fopen("randymanoj.txt","w+");
    //diff betn r,w,r+,w+?????
    if (fptr==NULL)
    {
        printf("ERRORRRRR");
        exit(1);
    }
    else //succheful termination and unseccful termination
    {
        printf("FILE KHULYO MACHHIKNEY\n");
    }
    printf("Write some content in the file:\n");

 while(ch!='\r')
    {
        ch=getche();
    fputc(ch,fptr);

    }



    rewind(fptr);

    printf("READ FROM THE FILE:\n");
    do
    {
      str=fgetc(fptr);
      putchar(str);
    }while (str!=EOF);

    printf("File Executed successfully.:");
    fclose(fptr);
    return 0;
}
