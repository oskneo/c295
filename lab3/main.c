
#include <stdio.h>


int get_byte_by_addr(int *, int i);

int get_byte_by_order(int x, int i) {
	// complete this in Part 2.

	return ((x & (0xff << (3-i)*8 )) >> (3-i)*8) & 0xff;
	// end of Part 2.
}

int x;
unsigned int y;


void main () {
	// complete this in Part 1.
	x = 0x01234567;
	y = 0xffffffd6;


	printf("x = 0x%08x\n", x);
	printf("x = %u\n", x);
	printf("y = 0x%08x\n", y);
	printf("y = %u\n", y);
	// end of Part 1

	int i;

	printf("x = 0x");
	for (i = 0; i < 4; i++) {
		printf("%02x", get_byte_by_order(x, i));
	}
	putchar('\n');

	printf("x = 0x");
	for (i = 0; i < 4; i++) {
		printf("%02x", get_byte_by_addr(&x, i));
	}
	putchar('\n');

	printf("y = 0x");
	for (i = 0; i < 4; i++) {
		printf("%02x", get_byte_by_order(y, i));
	}
	putchar('\n');

	printf("y = 0x");
	for (i = 0; i < 4; i++) {
		printf("%02x", get_byte_by_addr(&y, i));
	}
	putchar('\n');

    return;
}
