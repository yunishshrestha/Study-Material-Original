#include <iostream>
using namespace std;

void argument() {
    int p[4], q[4], p_im_q[4], p_im_q_np[4], result[4], c = 0;
    cout << "Enter the elements in p either 0 or 1:" << endl;
    for (int i = 0; i < 4; i++) {
        cin >> p[i];
    }
    cout << "Enter the elements in q either 0 or 1:" << endl;
    for (int i = 0; i < 4; i++) {
        cin >> q[i];
    }
    for (int i = 0; i < 4; i++) {
        if (p[i] == 1 && q[i] == 0) {
            p_im_q[i] = 0;
        } else {
            p_im_q[i] = 1;
        }
    }
    for (int i = 0; i < 4; i++) {
        p_im_q_np[i] = p[i] & p_im_q[i];
    }
    for (int i = 0; i < 4; i++) {
        if (p_im_q_np[i] == 1 && q[i] == 0) {
            result[i] = 0;
        } else {
            result[i] = 1;
        }
    }
    cout << "p\tq\tp->q\t(p->q)^p\t((p->q)^p)->q" << endl;
    for (int i = 0; i < 4; i++) {
        cout << p[i] << "\t" << q[i] << "\t" << p_im_q[i] << "\t\t" << p_im_q_np[i] << "\t\t\t" << result[i] << endl;
    }
    for (int i = 0; i < 4; i++) {
        if (result[i] == 1) {
            c++;
        }
    }
    if (c == 4) {
        cout << "The given argument is valid:" << endl;
    } else {
        cout << "The given argument is not valid:" << endl;
    }
}
int main() {
    argument();
    return 0;
}
