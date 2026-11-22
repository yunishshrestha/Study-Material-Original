#include<stdio.h>
 #include<conio.h>
 #define SIZE 10
 struct cqueue{
 int item[SIZE], front,rear;

 }cq;
 void insert(int);
 void delete();
 void display();
 void search(int);
 int main()
 {
     int value, choice,s;
     cq.front=SIZE-1;
     cq.rear=SIZE-1;
     while(1) {
        printf("\n1. Insertion\n2. Deletion\n3. Display\n4. Search\n5. Exit\n");
        printf("Enter your choice: \n");
        scanf("%d",&choice);
        switch(choice){
        case 1: printf("Enter the value to be inserted: ");
                scanf("%d",&value);
                insert(value);
                break;

        case 2:
            delete();
            break;

        case 3:
            display();
            break;

        case 4:
            printf("Enter the value to be searched: ");
                scanf("%d",&s);
            search(s);
            break;

            case 5: exit(0);

            default: printf("Invalid Choice. Try again.");
        }
     }
 }
 void insert(int d)
 {
     if(cq.front==(cq.rear+1)%SIZE)
     {
         printf("Queue Overflow");
     }
     else {
        cq.rear=(cq.rear+1)%SIZE;
        cq.item[cq.rear]=d;
     }
 }

 void delete()
 {
     if(cq.rear==cq.front)
     {
         printf("Queue is Empty.");
     }
     else
     {
         cq.front=(cq.front+1)%SIZE;
         printf("Deleted item is : ");
         printf("%d\n",cq.item[cq.front]);
         }
 }

 void display(){
 int i;
 if(cq.rear==cq.front)
     {
         printf("\nQueue is Empty.");
     }
     else {
        printf("Items of queue are: \n");
        for(i=(cq.front+1)%SIZE;i!=cq.rear;i=(i+1)%SIZE)
        {
            printf("%d\t",cq.item[i]);
        }
        printf("%d\t",cq.item[cq.rear]);
     }
 }

 void search( int s)
 {
     int i;
if(cq.rear==cq.front)
     {
         printf("\nQueue is Empty.");
     }
     i = (cq.front + 1) % SIZE;

   do {
        if(s==cq.item[i]){
            printf("\nElement found : %d",s);
        }

        i = (i + 1) % SIZE;
    }

    while (i != (cq.rear + 1) % SIZE);
}