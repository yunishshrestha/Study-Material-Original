// 3. Implement a C++ program that demonstrates the usage of namespaces. Create
// three namespaces called "English","Nepali" and “Newa”. All namespaces
// should define a function called "greet" that takes no parameters and returns a
// greeting message in the respective language. In the main function, invoke the
// "greet" function from each namespace and display the greetings.
#include<iostream>
using namespace std;
namespace english {
    void greet(){
    cout << "Hi, how are you brother?"<<endl;
    }
}
namespace nepali{
    void greet(){
    cout << "Namaskar, k chha hajur?"<<endl;
    }
}

namespace newari{
    void greet(){
    cout << "JOJOLOPPA, ji chanta matina yana."<<endl;
    }
}
int main(){
    newari::greet();
    english::greet();
    nepali::greet();
    return 0;
}