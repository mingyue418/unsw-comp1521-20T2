#include <stdio.h>

#include "put_string.h"

// print s to stdout with a new line appended using fputc (only)

void put_string(char *s) {
    
   // PUT YOUR CODE HERE
    char character;
    for (int i = 0; s[i] != 0; i++) {
        sscanf(&s[i], "%c", &character);
        fputc(character, stdout);
    }
    fputc('\n', stdout);
}
