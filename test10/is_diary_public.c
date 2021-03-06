#include <sys/types.h>
#include <sys/stat.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main(int argc, char *argv[]) {
    char *home = getenv("HOME");
    int length = strlen(home);
    char path[length + 10];
    snprintf(path, length + 8, "%s/.diary", home);
    struct stat s;
    if (stat(path, &s) != -1){
        if ((((s.st_mode) & S_IRGRP) == S_IRGRP) && (((s.st_mode) & S_IROTH) == S_IROTH)) {
            printf("1\n");
            return 0;
        } else {
            printf("0\n");
            return 0;
        }
    } else {
        printf("0\n");
        return 0;
    }
    
}
