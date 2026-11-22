// Write a menu driven program to print the truth table for the compound propositions
#include<iostream>
#include<cstdlib>
using namespace std;

void tautology()
{
    int p[4], q[4], pnq[4], puq[4], pnq_imp_puq[4];

    cout << "Enter the elements for p and q:" << endl;
    for (int i = 0; i < 4; i++)
    {
        cin >> p[i];
        cin >> q[i];
    }

    for (int i = 0; i < 4; i++)
    {
        pnq[i] = p[i] && q[i];
        puq[i] = p[i] || q[i];
    }
    for (int i = 0; i < 4; i++)
    {
        if (pnq[i] == 1 && puq[i] == 0)
            pnq_imp_puq[i] = 0;
        else
            pnq_imp_puq[i] = 1;
    }

    cout << "p\tq\tp^q\tpVq\t(p^q)->(pVq)" << endl;
    for (int i = 0; i < 4; i++)
    {
        cout << p[i] << "\t" << q[i] << "\t" << pnq[i] << "\t" << puq[i] << "\t" << pnq_imp_puq[i] << endl;
    }
}

void contradiction()
{
    int p[4], q[4], puq[4], np[4], nq[4], np_and_nq[4], res[4];

    cout << "Enter the elements for p and q:" << endl;
    for (int i = 0; i < 4; i++)
    {
        cin >> p[i];
        cin >> q[i];
    }

    for (int i = 0; i < 4; i++)
    {
        puq[i] = p[i] || q[i];
        np[i] = !p[i];
        nq[i] = !q[i];
    }


    for (int i = 0; i < 4; i++)
    {
        np_and_nq[i] = np[i] & nq[i];
    }

    for (int i = 0; i < 4; i++)
    {
        res[i] = puq[i] & np_and_nq[i];
    }

    cout << "The truth table is:" << endl;
    cout << "p\tq\t!p\t!q\t(pVq)\t(!p^!q)\t(pVq)^(!p^!q)" << endl;

    for (int i = 0; i < 4; i++)
    {
        cout << p[i] << "\t" << q[i] << "\t" << np[i] << "\t" << nq[i] << "\t" << puq[i] << "\t" << np_and_nq[i] << "\t" << res[i] << endl;
    }
}

int main()
{
    int choice;
    while (1)
    {
        cout << "1. Truth table for tautology." << endl;
        cout << "2. Truth table for contradiction." << endl;
        cout << "3. Exit" << endl;
        cout << "Enter the choice:" << endl;
        cin >> choice;

        switch (choice)
        {
            case 1:
                tautology();
                break;
            case 2:
                contradiction();
                break;
             case 3:
                exit(0);
            default:
                cout << "Invalid choice! Please try again." << endl;
        }
    }
}
