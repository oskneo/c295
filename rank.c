
void compute_ranks(float *F, int N, int *R, float *avg, float *passing_avg, int *num_passed) {
    int i, j;
    *num_passed = 0;
    *avg = 0.0;
    *passing_avg = 0.0;

    // init ranks
    int *x;
    // float*a,*b;
    // int *z=R+N;
    // float *w=F+N;
    for (i = 0; i < N; i++) {
        R[i] = 1;
    }
    // for (x=R; x < z; x++) {
    //     *x = 1;
    // }

    // compute ranks
    for (i = 0; i < N; i++) {
        for (j = 0; j < N; j++) {
            if (F[i] < F[j]) {
                R[i] += 1;
            }
        }
    }
    // a=F;
    // for (x=R; x < z; x++) {
    //     *x = 1;
    //     for (b=F; b < w; b++) {
    //         if (*a < *b) {
    //             *x += 1;
    //         }
    //     }
    //     a++;
    // }
    // int newavg=0;

    // compute averages
    // for (i = 0; i < N; i++) {
    //     *avg += F[i];
    //     if (F[i] >= 50.0) {
    //         *passing_avg += F[i];
    //         *num_passed += 1;
    //     }
    // }
    for (i = 0; i < N; i++) {
        *avg += F[i];
        if (F[i] >= 50.0) {
            *passing_avg += F[i];
            *num_passed += 1;
        }
    }

    // check for div by 0
    // if (*num_passed){   //Reduce memory aliasing by combine two if statements because we assume that num_passed will not be changed in the statement of *avg /= N.
    //     *passing_avg /= *num_passed;
    //     *avg /= N;
    // }
    if (*num_passed) *passing_avg /= *num_passed;
    if (N>0) *avg /= N;
    
    // *avg=newavg;
    

} // compute_ranks

