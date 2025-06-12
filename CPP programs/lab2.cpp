#include<iostream>
#include<cstdlib>
using namespace std;
void find_union(){
    float A[5],B[5],aub[5];
    cout<<"Enter the membership function for the set A with in the range of 0 and 1 or both inclusive:"<<endl;
    for(int i=0;i<5;i++) cin>>A[i];
    cout<<"Enter the membership function for the set B with in the range of 0 and 1 or both inclusive:"<<endl;
    for(int i=0;i<5;i++) cin>>B[i];
    cout<<"The union operation is:"<<endl;
    for(int i=0;i<5;i++) aub[i]=(A[i]>B[i])?A[i]:B[i];
    cout<<"Ua\tUb\tUa_Union_Ub"<<endl;
    for(int i=0;i<5;i++) cout<<A[i]<<"\t"<<B[i]<<"\t"<<aub[i]<<endl;
}
void find_intersection(){
    float A[5],B[5],ainb[5];
    cout<<"Enter the membership function for the set A with in the range of 0 and 1 or both inclusive:"<<endl;
    for(int i=0;i<5;i++) cin>>A[i];
    cout<<"Enter the membership function for the set B with in the range of 0 and 1 or both inclusive:"<<endl;
    for(int i=0;i<5;i++) cin>>B[i];
    cout<<"The intersection operation is:"<<endl;
    for(int i=0;i<5;i++) ainb[i]=(A[i]<B[i])?A[i]:B[i];
    cout<<"Ua\tUb\tUa_Intersection_Ub"<<endl;
    for(int i=0;i<5;i++) cout<<A[i]<<"\t"<<B[i]<<"\t"<<ainb[i]<<endl;
}
void find_complement(){
    float A[5];
    cout<<"Enter the membership fucntion for the set A with in the range of 0 and 1 or both inclusive:"<<endl;
    for(int i=0;i<5;i++) cin>>A[i];
    cout<<"The complement operation is:"<<endl;
    cout<<"Ua\tu'a"<<endl;
    for(int i=0;i<5;i++) cout<<A[i]<<"\t"<<1-A[i]<<endl;
}
int main(){
    int choice;
    while(1){
        cout<<"\n1. Find Intersection\n2. Find Union\n3. Find Complement\n4. Exit\nEnter your choice:";
        cin>>choice;
        switch(choice){
            case 1: find_intersection(); break;
            case 2: find_union(); break;
            case 3: find_complement(); break;
            case 4: exit(0);
            default: cout<<"The choice you entered is wrong"<<endl;
        }
    }
    return 0;
}
