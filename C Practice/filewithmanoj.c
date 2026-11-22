#include<stdio.h>
#include<stdlib.h>
typedef struct
{
int id;
float salary;
char name[50];
}employee;
int main()
{
    int i,j,n;
    employee emp1[50],temp;
    printf("Enter the value of n:\n");
    scanf("%d",&n);
 FILE *fp;
 fp=fopen("input.txt","w+");
 if(fp==NULL)
 {
     printf("The file not loaded.\n");
     exit(1);
 }
 //writing in file
 printf("Enter the data.\n");
 for (i=0;i<n;i++)
 {
     printf("emp[%d] \n",i);
     printf("ID= ");
     scanf(" %d",&emp1[i].id);
     fprintf(fp,"ID= %d\n",emp1[i].id);
     printf("NAME = ");
     scanf(" %[^\n]",emp1[i].name);
     fprintf(fp,"NAME= %s\n",emp1[i].name);
     printf("SALARY =");
     scanf(" %f",&emp1[i].salary);
     fprintf(fp,"SALARY= %f\n",emp1[i].salary);
 }
 rewind(fp);

 while(fscanf(fp,"ID= %d\n", &temp.id)==1 && fscanf(fp,"NAME= %[^\n]\n", temp.name)==1 && fscanf(fp,"SALARY= %f\n", &temp.salary)==1)

    {
        printf("\nName= %s\n ID= %d\n SALARY= %f\n",temp.name,temp.id,temp.salary);

    }
    fclose(fp);
    return 0;

}
