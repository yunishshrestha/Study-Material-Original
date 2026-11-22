#include<stdio.h>
int main()
{
    int a[50],n,i;
    printf("Enter the no of array you want to give\n");
    scanf("%d",&n);
    //reading array from user
    printf("Give %d array accordingly\n",n);
    for(i=0;i<n;i++)
    {
        printf("a[%d]= ",i);
        scanf("%d",&a[i]);
    }
    //displaying the array content
    printf("The array you entered are given below\n");
    for(i=0;i<n;i++)
    {
        printf("a[%d]=%d\n",i,a[i]);
    }
    return 0;

}
