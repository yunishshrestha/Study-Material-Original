// WAP to implement dynamic memory allocation with new and delete
// operators (for both simple variable and array variable).
#include<iostream>
using namespace std;
int main(){

    int* a;
    a= new int;
    cout<<"Enter a :"<<endl;
    cin>>a;
    cout<<a;
    delete a;
    return 0;

}