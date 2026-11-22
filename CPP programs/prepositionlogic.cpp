#include <stdio.h>
#include <stdlib.h>

struct node
{
    int data;
    struct node *next;
};

struct node *start = NULL;


void insert_at_begin(int);
void insert_pos();
void insert_end();
void traverse();

int main()
{
    int choice, data;

    while (1)
    {
        printf("\n1. Insert at beginning\n");
        printf("2. Insert at end\n");
        printf("3. Insert at any position\n");
        printf("4. Traverse\n");
        printf("5. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);

        switch (choice)
        {
        case 1:
            printf("Enter value of element: ");
            scanf("%d", &data);
            insert_at_begin(data);
            break;

        case 2:
            insert_end();
            break;

        case 3:
            insert_pos();
            break;

        case 4:
            traverse();
            break;

        case 5:
            exit(0);

        default:
            printf("Invalid choice. Try again.\n");
        }
    }
}


void insert_at_begin(int x)
{
    struct node *temp;
    temp = (struct node *)malloc(sizeof(struct node));

    temp->data = x;
    temp->next = start;
    start = temp;
}


void insert_pos()
{
    struct node *temp, *ptr;
    int pos, i;

    temp = (struct node *)malloc(sizeof(struct node));

    printf("Enter position: ");
    scanf("%d", &pos);

    printf("Enter data: ");
    scanf("%d", &temp->data);

    if (pos == 0)
    {
        temp->next = start;
        start = temp;
        return;
    }

    ptr = start;
    for (i = 0; i < pos - 1; i++)
    {
        if (ptr == NULL)
        {
            printf("Position not found\n");
            return;
        }
        ptr = ptr->next;
    }

    temp->next = ptr->next;
    ptr->next = temp;
}


void insert_end()
{
    struct node *temp, *ptr;

    temp = (struct node *)malloc(sizeof(struct node));

    printf("Enter data: ");
    scanf("%d", &temp->data);

    temp->next = NULL;

    if (start == NULL)
    {
        start = temp;
    }
    else
    {
        ptr = start;
        while (ptr->next != NULL)
        {
            ptr = ptr->next;
        }
        ptr->next = temp;
    }
}


void traverse()
{
    struct node *ptr;

    if (start == NULL)
    {
        printf("List is empty\n");
        return;
    }

    ptr = start;
    printf("Linked List: ");
    while (ptr != NULL)
    {
        printf("%d  ", ptr->data);
        ptr = ptr->next;
    }
    printf("NULL\n");
}