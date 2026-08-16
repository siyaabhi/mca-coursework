A letter means push and an asterisk means pop in the  following sequence. Give the sequence of values returned by the pop operations when this sequence of operations is performed on an initially empty LIFO stack.
 E A S * Y * Q U E * * * S T * * * I O * N * * *

#include <stdio.h>
#define MAX 50
char stack[MAX];
int top = -1;
// Push operation
void push(char value)
{
    top++;
    stack[top] = value;
}
void pop()
{
    if (top == -1)
    {
        printf("Stack Underflow\n");
    }
    else
    {
        printf("%c ", stack[top]);
        top--;
    }
}
int main()
{
    char sequence[] = "EAS*Y*QUE***ST***IO*N***";
    int i;
    printf("Values returned by POP operations:\n");
    for (i = 0; sequence[i] != '\0'; i++)
    {
        if (sequence[i] == '*')
        {
            pop();
        }
        else
        {
            push(sequence[i]);
        }
    }
    return 0;
}
