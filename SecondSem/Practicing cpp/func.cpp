#include<iostream>
using namespace std;

void greeting(string name,int number)
{
    cout <<"Hi, "<<name<<"!"<<endl;
    cout<<"Your number is : "<<number<<endl;
}
int main ()
{
    greeting("Raj Shrestha",982);
    greeting("Yunish Shrestha",48);
    return 0;
}