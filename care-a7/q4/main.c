
#include <stdio.h>

int *new_42(void);  // creates a new int in dynamic memory (stack)
void donotmuchofanything(int *);

void main () {
    int *int_ptr;
    int_ptr = new_42();
    printf("The current value is %d.\n", *int_ptr);
    donotmuchofanything(int_ptr);
    printf("The current value is %d.\n", *int_ptr);
}

