
#include <stdio.h>
int *new_42(void) {
    int x;
    int *ret;

    x = 42;
    ret = &x;

    return ret;
} // new_42

int N = 1;

void donotmuchofanything(int *a) {
    if (N--) {
        
        donotmuchofanything(a);
        N++;
    }
} // donotmuchofanything

