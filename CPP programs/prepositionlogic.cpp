#include <iostream>
#include <cstdlib>

using namespace std;

void find_truth_table_of_conjunction() {
    int p[4], q[4], pnq[4];

    cout << "Enter the elements for p either 0 or 1:" << endl;
    for (int i = 0; i < 4; i++)
        cin >> p[i];

    cout << "Enter the elements for q either 0 or 1:" << endl;
    for (int i = 0; i < 4; i++)
        cin >> q[i];

    for (int i = 0; i < 4; i++)
        pnq[i] = p[i] & q[i];

    cout << "The truth table for the conjunction is:" << endl;
    cout << "p\tq\tp^q" << endl;
    for (int i = 0; i < 4; i++)
        cout << p[i] << "\t" << q[i] << "\t" << pnq[i] << endl;
}

void find_truth_table_of_Disjunction() {
    int p[4], q[4], porq[4];

    cout << "Enter the elements for p either 0 or 1:" << endl;
    for (int i = 0; i < 4; i++)
        cin >> p[i];

    cout << "Enter the elements for q either 0 or 1:" << endl;
    for (int i = 0; i < 4; i++)
        cin >> q[i];

    for (int i = 0; i < 4; i++)
        porq[i] = p[i] | q[i];

    cout << "The truth table for the Disjunction is:" << endl;
    cout << "p\tq\tp|q" << endl;
    for (int i = 0; i < 4; i++)
        cout << p[i] << "\t" << q[i] << "\t" << porq[i] << endl;
}

void find_truth_table_of_Negation() {
    int p[2], np[2];

    cout << "Enter the elements for p either 0 or 1:" << endl;
    for (int i = 0; i < 2; i++)
        cin >> p[i];

    for (int i = 0; i < 2; i++)
        np[i] = !p[i];

    cout << "The truth table for Negation is:" << endl;
    cout << "p\t!p" << endl;
    for (int i = 0; i < 2; i++)
        cout << p[i] << "\t" << np[i] << endl;
}

void find_truth_table_of_implication() {
    int p[4], q[4], pimq[4];

    cout << "Enter the elements for p either 0 or 1:" << endl;
    for (int i = 0; i < 4; i++)
        cin >> p[i];

    cout << "Enter the elements for q either 0 or 1:" << endl;
    for (int i = 0; i < 4; i++)
        cin >> q[i];

    for (int i = 0; i < 4; i++) {
        if (p[i] == 1 && q[i] == 0)
            pimq[i] = 0;
        else
            pimq[i] = 1;
    }

    cout << "The truth table for the Implication is:" << endl;
    cout << "p\tq\tp->q" << endl;
    for (int i = 0; i < 4; i++)
        cout << p[i] << "\t" << q[i] << "\t" << pimq[i] << endl;
}

void find_truth_table_of_Bi_implication() {
    int p[4], q[4], pbiimg[4];

    cout << "Enter the elements for p either 0 or 1:" << endl;
    for (int i = 0; i < 4; i++)
        cin >> p[i];

    cout << "Enter the elements for q either 0 or 1:" << endl;
    for (int i = 0; i < 4; i++)
        cin >> q[i];

    for (int i = 0; i < 4; i++) {
        if ((p[i] == 1 && q[i] == 1) || (p[i] == 0 && q[i] == 0))
            pbiimg[i] = 1;
        else
            pbiimg[i] = 0;
    }

    cout << "The truth table for the Bi-implication is:" << endl;
    cout << "p\tq\tp<->q" << endl;
    for (int i = 0; i < 4; i++)
        cout << p[i] << "\t" << q[i] << "\t" << pbiimg[i] << endl;
}

int main() {
    int choice;

    while (1) {
        cout << "\n1. Print the truth table for Conjunction:" << endl;
        cout << "2. Print the truth table for Disjunction:" << endl;
        cout << "3. Print the truth table for Implication:" << endl;
        cout << "4. Print the truth table for Negation:" << endl;
        cout << "5. Print the truth table for Bi-implication:" << endl;
        cout << "6. Exit:" << endl;
        cout << "Enter the choice:" << endl;

        cin >> choice;

        switch (choice) {
            case 1:
                find_truth_table_of_conjunction();
                break;
            case 2:
                find_truth_table_of_Disjunction();
                break;
            case 3:
                find_truth_table_of_implication();
                break;
            case 4:
                find_truth_table_of_Negation();
                break;
            case 5:
                find_truth_table_of_Bi_implication();
                break;
            case 6:
                exit(0);
            default:
                cout << "The choice you entered is not correct." << endl;
        }
    }

    return 0;
}