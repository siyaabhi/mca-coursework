 Reverse a string using Stack
#include <stdio.h>
#include <string.h>
int main()
{
    char str[100], stack[100];
    int top = -1;
    int i;
    printf("Enter a string: ");
    scanf("%s", str);
    for(i = 0; i < strlen(str); i++)
    {
        top++;
        stack[top] = str[i];
    }
    printf("Reverse string: ");
    while(top >= 0)
    {
        printf("%c", stack[top]);
        top--;
    }
    return 0;
}
