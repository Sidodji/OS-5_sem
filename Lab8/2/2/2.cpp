#include <iostream>
#include <ctime>

using namespace std;

int main() {
    clock_t start = clock();
    bool fl5 = true, fl10 = true;

    for (int i = 0;;i++) {
        //выводим значение счетчика итераций 5 секунд
        if ((clock() - start) / CLOCKS_PER_SEC == 5 && fl5) {
            cout << "5 c - " << i << endl;
            fl5 = false;
        }
        //выводим значение счетчика итераций 10 секунд
        else if ((clock() - start) / CLOCKS_PER_SEC == 10 && fl10) {
            cout << "10 c - " << i << endl;
            fl10 = false;
        }
        //выводим значение счетчика итераций 15 секунд
        else if ((clock() - start) / CLOCKS_PER_SEC == 15) {
            cout << "15 c - " << i << endl;
            break;
        }
    }

    system("pause");
    return 0;
}
