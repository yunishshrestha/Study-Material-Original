#include<stdio.h>
#include<stdlib.h>

int main() {
    int n, choice, new_size, i;
    int *ptr = NULL;

    do {
        printf("\n select the following \n");
        printf("1. allocate memory using malloc\n");
        printf("2. allocate memory using calloc\n");
        printf("3. reallocate memory using realloc\n");
        printf("4. Free allocate memory\n");
        printf("5. exit\n");
        printf("enter your choice: ");
        scanf("%d",&choice);

        switch(choice) {

        case 1:
            if (ptr != NULL) {
                printf("Memory already allocated. Free it before allocating again.\n");
                break;
            }
            printf("enter the number of elements:");
            scanf("%d",&n);

            ptr = (int*)malloc(n * sizeof(int));
            if (ptr == NULL) {
                printf("Memory allocation failed.\n");
                break;
            }

            printf("memory allocated using malloc.\n");
            for(i=0; i<n; i++) {
                printf("Enter number: ");
                scanf("%d", &ptr[i]);
            }

            printf("stored values: ");
            for(i=0; i<n; i++) {
                printf("%d ", ptr[i]);
            }
            printf("\n");
            break;


        case 2:
            if (ptr != NULL) {
                printf("Memory already allocated. Free it before allocating again.\n");
                break;
            }
            printf("enter the number of elements:");
            scanf("%d",&n);

            ptr = (int*)calloc(n, sizeof(int));
            if (ptr == NULL) {
                printf("Memory allocation failed.\n");
                break;
            }

            printf("memory allocated using calloc.\n");
            for(i=0; i<n; i++) {
                printf("Enter number: ");
                scanf("%d", &ptr[i]);
            }

            printf("stored values: ");
            for(i=0; i<n; i++) {
                printf("%d ", ptr[i]);
            }
            printf("\n");
            break;


        case 3:
            if (ptr == NULL) {
                printf("No memory to reallocate. Allocate first using malloc or calloc.\n");
                break;
            }

            printf("enter the new number of elements:");
            scanf("%d", &new_size);

            ptr = (int*)realloc(ptr, new_size * sizeof(int));
            if (ptr == NULL) {
                printf("Memory reallocation failed.\n");
                break;
            }

            printf("memory reallocated using realloc.\n");

            for (i = 0; i < new_size; i++) {
                printf("Enter number: ");
                scanf("%d", &ptr[i]);
            }

            printf("stored values: ");
            for (i = 0; i < new_size; i++) {
                printf("%d ", ptr[i]);
            }
            printf("\n");

            n = new_size;
            break;


        case 4:
            if (ptr == NULL) {
                printf("no memory to free.\n");
                break;
            }
            free(ptr);
            ptr = NULL;
            printf("memory freed.\n");
            break;


        case 5:
            printf("exiting program.\n");
            break;


        default:
            printf("Invalid choice. please try again.\n");
        }

    } while (choice != 5);

    return 0;
}
