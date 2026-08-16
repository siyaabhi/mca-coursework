Implement stack operations using arrays.

#include <stdio.h>
int main()
{
    int stack[100];
    int top = -1;
    int choice, value, i;
    do
    {
        printf("\n1. Push");
        printf("\n2. Pop");
        printf("\n3. Display");
        printf("\n4. Exit");
        printf("\nEnter your choice: ");
        scanf("%d", &choice);
        switch(choice)
        {
            case 1:
                if(top == 99)
                    printf("Stack Overflow");
                else
                {
                    printf("Enter value: ");
                    scanf("%d", &value);
                    top++;
                    stack[top] = value;
                }
                break;

            case 2:
                if(top == -1)
                    printf("Stack Underflow");
                else
                {
                    printf("Popped value = %d", stack[top]);
                    top--;
                }
                break;

            case 3:
                if(top == -1)
                    printf("Stack is empty");
                else
                {
                    printf("Stack elements:\n");
                    for(i = top; i >= 0; i--)
                        printf("%d\n", stack[i]);
                }
                break;

            case 4:
                printf("Exit");
                break;
                
            default:
                printf("Invalid choice");
        }
    } while(choice != 4);
    return 0;
}

