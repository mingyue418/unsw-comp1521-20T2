#include <ctype.h>
#include <stdio.h>
#include <stdbool.h>


int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "the number of arguments is wrong!");
        return 1;
    }
    FILE *in = fopen(argv[1], "r");
    if (in == NULL) {
        perror("argv[1]");
        return 1;
    }

    int character = fgetc(in);
    while (character != EOF) {
        int i = 0;
        bool flag = false;
        char string[1000];
        while (isprint(character)) {
            string[i] = character;
            i++;
            flag = true;
            character = fgetc(in);
        }
        string[i] = 0;
        if (flag && i >= 4) {
            printf("%s\n", string);
        }
        
        character = fgetc(in);
    }
    return 0;
}
