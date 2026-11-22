#include <iostream>

using namespace std;



int find_power(int a, int n)

{

    if (n == 0)

    {

        return 1;

    }

    else

    {

        return a * (find_power(a, n - 1));

    }

}



int find_factorial(int n)

{

    if (n == 0)

    {

        return 1;

    }

    else

        return n * find_factorial(n - 1);

}



int main()

{

    int choice;

    while (1)

    {

        cout << "1. Find the power(a,n):" << endl;

        cout << "2. Find the factorial(n):" << endl;

        cout << "3. Exit:" << endl;

        cout << "Enter the choice:" << endl;

        cin >> choice;



        switch (choice)

        {

        case 1:

        {

            int number, p;

            cout << "Enter the base number:" << endl;

            cin >> number;

            cout << "Enter the power number:" << endl;

            cin >> p;

            int result = find_power(number, p);

            cout << "Result = " << result << endl;

            break;

        }

        case 2:

        {

            int numb;

            cout << "Enter the number that you want to calculate the factorial for:" << endl;

            cin >> numb;

            int res = find_factorial(numb);

            cout << "The factorial of the given number is:" << res << endl;

            break;

        }

        case 3:

            exit(0);

        default:

            cout << "The choice you entered is wrong:" << endl;

        }

    }



    return 0;

}