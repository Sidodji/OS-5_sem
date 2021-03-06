#include <Windows.h>
#include <iostream>

DWORD WINAPI OS04_02_T1() {
    DWORD pid = GetCurrentProcessId();
    DWORD tid = GetCurrentThreadId();

    for (int i = 0; i < 500; ++i) {
        Sleep(300);
        std::cout << i << ". T1 PID = " << pid << ", TID = " << tid << std::endl;
    }

    return 0;
}

DWORD WINAPI OS04_02_T2() {
    DWORD pid = GetCurrentProcessId();
    DWORD tid = GetCurrentThreadId();

    for (int i = 0; i < 1250; ++i) {
        Sleep(300);
        std::cout << i << ". T2 PID = " << pid << ", TID = " << tid << std::endl;
    }

    return 0;
}

int main() {
    DWORD pid = GetCurrentProcessId();
    DWORD tid = GetCurrentThreadId();

    DWORD childId_T1, childId_T2 = NULL;

    HANDLE hChild1 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)OS04_02_T1, NULL, 0, &childId_T1);
    HANDLE hChild2 = CreateThread(NULL, 0, (LPTHREAD_START_ROUTINE)OS04_02_T2, NULL, 0, &childId_T2);

    for (int i = 0; i < 10000; ++i) {
        Sleep(300);
        std::cout << i << ". Parent Thread PID = " << pid << ", TID = " << tid << std::endl;
    }
    
    WaitForSingleObject(hChild1, INFINITE);
    WaitForSingleObject(hChild2, INFINITE);

    CloseHandle(hChild1);
    CloseHandle(hChild2);

    return 0;
}

