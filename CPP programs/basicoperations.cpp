#include <iostream>
using namespace std;

void find_floor() {
    float num;
    cout << "Enter a real number: ";
    cin >> num;

    if (num >= 0 || int(num) == num) {
        cout << "The floor function of the real number is: " << int(num) << endl;
    } else {
        cout << "The floor function of the real number is: " << int(num) - 1 << endl;
    }
}

void find_ceil() {
    float num;
    cout << "Enter a real number: ";
    cin >> num;

    if (int(num) == num) {
        cout << "The ceiling function of the real number is: " << int(num) << endl;
    } else if (num > 0) {
        cout << "The ceiling function of the real number is: " << int(num) + 1 << endl;
    } else {
        cout << "The ceiling function of the real number is: " << int(num) << endl;
    }
}

int main() {
    int choice;

    while (1) {
        cout << "\nEnter your choice:" << endl;
        cout << "1. Floor Function" << endl;
        cout << "2. Ceiling Function" << endl;
        cout << "3. Exit" << endl;
        cin >> choice;

        switch (choice) {
            case 1:
                find_floor();
                break;
            case 2:
                find_ceil();
                break;
            case 3:
                exit(0);
            default:
                cout << "Invalid Entry" << endl;
        }
    }

return 0;
}