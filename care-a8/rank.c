
void compute_ranks(float *F, int N, int *R, float *avg, float *passing_avg, int *num_passed) {
    int i, j;
    *num_passed = 0;
    *avg = 0.0;
    *passing_avg = 0.0;

    // init ranks
    int *x;
    int *z=R+N;
    // for (i = N; --i; ) {
    //     R[i] = 1;
    // }
    // for (x=R; x < z; x+=1) {
    //     *x = 1;
    // }
    
    for (i = 0; i < N; i++) {
        R[i] = 1;
    }

    // compute ranks
    float *a, *b, *w;
    a=F;
    w=F+N;
    for (i=0; i < N; i++) {
        
        for (b=F;  b< w; b+=1) {
            if (F[i] <*b ) {
                R[i] += 1;
            }
        }
        // a+=1;
    }
    
    
    // for (i = 0; i < N; i++) {
    //     for (j = 0; j < N; j++) {
    //         if (F[i] < F[j]) {
    //             R[i] += 1;
    //         }
    //     }
    // }

    // compute averages
    for (i = 0; i < N; i++) {
        *avg += F[i];
        if (F[i] >= 50.0) {
            *passing_avg += F[i];
            *num_passed += 1;
        }
    }

    // check for div by 0
    if (N > 0) *avg /= N;
    if (*num_passed) *passing_avg /= *num_passed;

} // compute_ranks

