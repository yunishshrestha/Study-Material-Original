#include <iostream>
#include <cstdlib>
using namespace std;

// ----------- Function Prototypes -----------
int fact(int n);
void getResult(string input, int l, int r);

// ----------- Function Definitions -----------

// Recursive factorial function
int fact(int n)
{
    if (n == 0 || n == 1)
        return 1;
    else
        return n * fact(n - 1);
}

// Function to print all permutations of a string
void getResult(string input, int l, int r)
{
    if (l == r)
    {
        cout << input << endl;
    }
    else
    {
        for (int i = l; i <= r; i++)
        {
            swap(input[l], input[i]);
            getResult(input, l + 1, r);
            swap(input[l], input[i]); // backtrack
        }
    }
}

// ----------- Main Program -----------
int main()
{
    int choice;
    while (1)
    {
        cout << "1. Find the number of combinations:" << endl;
        cout << "2. Find the number of permutations:" << endl;
        cout << "3. Generate the Permutations" << endl;
        cout << "4. Exit:" << endl;
        cout << "Enter the choice:" << endl;
        cin >> choice;

        switch (choice)
        {
        case 1:
        {
            int n, r, comb;
            cout << "Enter number: ";
            cin >> n;
            cout << "Enter r: ";
            cin >> r;
            if (n >= r)
            {
                comb = fact(n) / (fact(r) * fact(n - r));
                cout << "Combinations = " << comb << endl;
            }
            else
            {
                cout << "The value " << n << " should be greater than " << r << endl;
            }
            break;
        }

        case 2:
        {
            int n, r, per;
            cout << "Enter number: ";
            cin >> n;
            cout << "Enter r: ";
            cin >> r;
            if (n >= r)
            {
                per = fact(n) / fact(n - r);
                cout << "Permutations = " << per << endl;
            }
            else
            {
                cout << "The value " << n << " should be greater than " << r << endl;
            }
            break;
        }

        case 3:
        {
            string str;
            cout << "Enter the string:" << endl;
            cin >> str;
            int n = str.size();
            cout << "All Permutations:" << endl;
            getResult(str, 0, n - 1);
            break;
        }

        case 4:
            exit(0);

        default:
            cout << "The choice you entered is wrong:" << endl;
        }
    }

    return 0;
}
