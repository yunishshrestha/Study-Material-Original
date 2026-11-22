#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct {
    char name[50];
    int roll_no;
    float marks;
} records;

// Function prototypes
void entry();
void search(int roll);

int main() {
    int choose, roll;

    while (1) {
        printf("\n1. Write records to file\n");
        printf("2. Search records with Roll-Number\n");
        printf("3. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choose);

        switch (choose) {
            case 1:
                entry();
                break;
            case 2:
                printf("Enter the roll-no that you want to search: ");
                scanf("%d", &roll);
                search(roll);
                break;
            case 3:
                exit(0);
            default:
                printf("Invalid Number. Please try again.\n");
        }
    }

    return 0;
}

void entry() {
    FILE *fptr;
    records r;

    fptr = fopen("Records.txt", "w+");
    if (fptr == NULL) {
        printf("Corrupted file\n");
        exit(1);
    }

    printf("Enter the Records:\n");
    printf("Enter the name: ");
    fflush(stdin);
    scanf("%s", r.name);

    printf("Enter the roll no: ");
    fflush(stdin);
    scanf("%d", &r.roll_no);

    printf("Enter the marks: ");
    fflush(stdin);
    scanf("%f", &r.marks);

    fprintf(fptr, "%s\n%d\n%.2f\n\n", r.name, r.roll_no, r.marks);
    fclose(fptr);

    printf("Record added successfully.\n");
}

void search(int roll) {
    FILE *fptr;
    records r;
    int found = 0;

    fptr = fopen("Records.txt", "r");
    if (fptr == NULL) {
        printf("File not found.\n");
        return;
    }

    while (fscanf(fptr, "%s %d %f", r.name, &r.roll_no, &r.marks) != EOF) {
        if (r.roll_no == roll) {
            printf("\nRecord Found:\n");
            printf("Name: %s\n", r.name);
            printf("Roll No: %d\n", r.roll_no);
            printf("Marks: %.2f\n", r.marks);
            found = 1;
            break;
        }
    }

    if (!found) {
        printf("No record found for Roll No: %d\n", roll);
    }

    fclose(fptr);
}
