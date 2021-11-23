#include <iostream>
#include <Windows.h>

using namespace std;
#define PG (4096)
int pg = 256;

int main()
{
	setlocale(LC_ALL, "rus");

	int* m1 = (int*)VirtualAlloc(NULL, pg * PG, MEM_COMMIT, PAGE_READWRITE);
	for (int i = 0; i < pg * PG / 4; i++)
	{
		m1[i] = i;
	}
	// А = C0
	// Л = CB
	// И = C8
	// --------
	// Страница C0 = 192, смещение CB8 = 3256
	int* m2 = m1 + 192 * 1024 + 3256;
	cout << *m2 << endl;
	system("pause");
}

