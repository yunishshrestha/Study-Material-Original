/*to Input age of 12 people and display:

Average

Ages between 25 to 30
*/

#include<stdio.h>
int main()
{
    int age[12],avg,sum,i,j;
    printf("Enter the different ages simultaneously.\n");
    for (i=0;i<12;i++)
    {
        printf("Enter age of person%d : ",i+1);
        scanf("%d",&age[i]);

    }
    sum=0;

    for (i=0;i<12;i++)
    {


            sum=sum+age[i];

    if (age[i]>=25 && age[i]<=30)
    {


        printf("age[%d]=%d\t",i,age[i]);
    }
    avg=sum/12;

    }
    printf("The average of 12 ages = %d",avg);

    return 0;
}
