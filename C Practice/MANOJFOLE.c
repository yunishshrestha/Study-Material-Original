#include <stdio.h>
#include <stdlib.h>

int main() {
    FILE *fptr;
    char ch;

    // Open file in read/write mode
    fptr = fopen("randymanoj.txt", "w+");

    if (fptr == NULL)
        {
        printf("ERROR: Unable to open file.\n");
        exit(1);
    }
    else
        {
        printf("FILE OPENED SUCCESSFULLY!\n");
    }

    // Writing to file
    printf("Write some content in the file (press Enter to stop):\n");
    while ( ch!= '\r')
     {
         ch = getchar();
        fputc(ch, fptr);
    }

    // Move file pointer to the beginning
    rewind(fptr);

    // Reading from file
    printf("\nREADING FROM FILE:\n");
    while (ch!= EOF)
        {
           ch = fgetc(fptr);
        putchar(ch);
    }

    printf("\nFile Executed Successfully.\n");

    // Close the file
    fclose(fptr);

    return 0;
}
