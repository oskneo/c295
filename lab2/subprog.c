typedef unsigned short bit16;
char *cvt2bitstr(bit16 x, char* str) {
    int i;
    for (i = 0; i < 16; i++) {
        if(x!=0x0){
            str[i] = (char) ((x & 0x8000) >> 15) | 0x30;
            x = (x << 1) & 0xffff;
        }
        else{
            str[i]='0';
        }
        
        
    }
    str[16] = '\0';
    return str;
}
