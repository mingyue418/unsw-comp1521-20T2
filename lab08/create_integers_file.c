#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "the number of arguments is wrong!");
        return 1;
    }
    FILE *in = fopen(argv[1], "w");
    if (in == NULL) {
        perror(argv[1]);
        return 1;
    }
    int num1 = atoi(argv[2]);
    int num2 = atoi(argv[3]);
    for (int i = num1; i <= num2; i++) {
        fprintf(in, "%d\n", i);
    }
    return 0;
}
