
void compute_ranks(float *F, int N, int *R, float *avg, float *passing_avg, int *num_passed) {
    int i, j;
    int limit=(N/4)*4;
    int newavg=0;
    int newpassing_avg = 0;
    int newnum_passed=0;
    for (i=0; i < limit; i+=4) {
        R[i] = 1;
        
        for (j = 0; j < limit; j+=4) {
            if (F[i] < F[j]) {
                R[i] += 1;
            }
            if (F[i] < F[j+1]) {
                R[i] += 1;
            }
            if (F[i] < F[j+2]) {
                R[i] += 1;
            }
            if (F[i] < F[j+3]) {
                R[i] += 1;
            }
        }
        for (;j < N; j++) {
            if (F[i] < F[j]) {
                R[i] += 1;
            }
        }
        newavg += F[i];
        if (F[i] >= 50.0) {
            newpassing_avg += F[i];
            newnum_passed += 1;
        }


        R[i+1] = 1;
        
        for (j = 0; j < limit; j+=4) {
            if (F[i+1] < F[j]) {
                R[i+1] += 1;
            }
            if (F[i+1] < F[j+1]) {
                R[i+1] += 1;
            }
            if (F[i+1] < F[j+2]) {
                R[i+1] += 1;
            }
            if (F[i+1] < F[j+3]) {
                R[i+1] += 1;
            }
        }
        for (;j < N; j++) {
            if (F[i+1] < F[j]) {
                R[i+1] += 1;
            }
        }
        newavg += F[i+1];
        if (F[i+1] >= 50.0) {
            newpassing_avg += F[i+1];
            newnum_passed += 1;
        }


        R[i+2] = 1;
        
        for (j = 0; j < limit; j+=4) {
            if (F[i+2] < F[j]) {
                R[i+2] += 1;
            }
            if (F[i+2] < F[j+1]) {
                R[i+2] += 1;
            }
            if (F[i+2] < F[j+2]) {
                R[i+2] += 1;
            }
            if (F[i+2] < F[j+3]) {
                R[i+2] += 1;
            }
        }
        for (;j < N; j++) {
            if (F[i+2] < F[j]) {
                R[i+2] += 1;
            }
        }
        newavg += F[i+2];
        if (F[i+2] >= 50.0) {
            newpassing_avg += F[i+2];
            newnum_passed += 1;
        }


        R[i+3] = 1;
        
        for (j = 0; j < limit; j+=4) {
            if (F[i+3] < F[j]) {
                R[i+3] += 1;
            }
            if (F[i+3] < F[j+1]) {
                R[i+3] += 1;
            }
            if (F[i+3] < F[j+2]) {
                R[i+3] += 1;
            }
            if (F[i+3] < F[j+3]) {
                R[i+3] += 1;
            }
        }
        for (;j < N; j++) {
            if (F[i+3] < F[j]) {
                R[i+3] += 1;
            }
        }
        newavg += F[i+3];
        if (F[i+3] >= 50.0) {
            newpassing_avg += F[i+3];
            newnum_passed += 1;
        }
    }
    for (; i < N; i++) {
        R[i] = 1;
        
        for (j = 0; j < limit; j+=4) {
            if (F[i] < F[j]) {
                R[i] += 1;
            }
            if (F[i] < F[j+1]) {
                R[i] += 1;
            }
            if (F[i] < F[j+2]) {
                R[i] += 1;
            }
            if (F[i] < F[j+3]) {
                R[i] += 1;
            }
        }
        for (;j < N; j++) {
            if (F[i] < F[j]) {
                R[i] += 1;
            }
        }
        newavg += F[i];
        if (F[i] >= 50.0) {
            newpassing_avg += F[i];
            newnum_passed += 1;
        }
    }


    // check for div by 0
    if (N > 0) *avg = (float)newavg/ N;
    if (newnum_passed) *passing_avg =(float)newpassing_avg/ newnum_passed;
    
    *num_passed=newnum_passed;


} // compute_ranks

