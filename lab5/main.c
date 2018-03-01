
#include "qsorts.h"
#include <stdio.h>
#include <stdlib.h>
#include <sys/types.h>
#include <sys/times.h>
#include <sys/time.h>
#include <sys/resource.h>

#define N 1000000

int A[N];

void main () {
    srand(time(NULL));
    int i;
    int pos;
    int tmp;
    struct rusage start,start1,start2;
    struct rusage end,end1,end2;

    getrusage(RUSAGE_SELF, &start);
    A[i] = 0;
    for (i = 1; i < N; i++) {
        A[i] = i / 100;
        pos = (((rand() % 0x7fff) << 16) | (rand() % 0xffff)) % (i+1);
        tmp = A[i];
        A[i] = A[pos];
        A[pos] = tmp;
    }
    getrusage(RUSAGE_SELF, &end);
    printf("It took %ld microseconds to initialize the array.\n", end.ru_utime.tv_usec + end.ru_stime.tv_usec - start.ru_utime.tv_usec - start.ru_stime.tv_usec);

    // For Part 2:
    // 
    getrusage(RUSAGE_SELF, &start1);
    qsort295_1(A, N);
    getrusage(RUSAGE_SELF, &end1);
    printf("It took %ld microseconds to initialize the array.\n", end1.ru_utime.tv_usec + end1.ru_stime.tv_usec - start1.ru_utime.tv_usec - start1.ru_stime.tv_usec);

    getrusage(RUSAGE_SELF, &start2);
    qsort295_2(A, N);
    getrusage(RUSAGE_SELF, &end2);
    printf("It took %ld microseconds to initialize the array.\n", end2.ru_utime.tv_usec + end2.ru_stime.tv_usec - start2.ru_utime.tv_usec - start2.ru_stime.tv_usec);
}

