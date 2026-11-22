#include<stdio.h>
typedef struct
{
    char name[50];
    int roll;
} student;
int main()
{
    int i,n,j;
    student temp;
    student s[100];
    printf("Enter the total number of the students(n): ");
    scanf("%d",&n);
    printf("\nEnter the name and roll number of the students:\n");
    for (i=0;i<n;i++)
    {
        printf("\nEnter the data for student %d\n",i+1);
        printf("Enter the name: ");
        fflush(stdin);
        gets(s[i].name);
        printf("Enter Roll number: ");
        fflush(stdin);
        scanf("%d",&s[i].roll);
    }
      printf("\n\nThe students with roll number greater than 20 are :\n");
      for (i=0;i<n;i++)
      {
          if (s[i].roll>20)
          {
              printf("\nNAME : %s \t\t\t ROLL NO. :%d",s[i].name,s[i].roll);

          }
      }

      for (i=0;i<n;i++)
      {

          for (j=1+i;j<n;j++)
          {
              temp = s[i];
                s[i] = s[j];
                s[j] = temp;
          }
      }

      printf("\n\nStudents sorted by roll number in ascending order:\n");
    for (i = 0; i < n; i++) {
        printf("NAME: %s \t ROLL NO.: %d\n", s[i].name, s[i].roll);
    }


    return 0;

}
