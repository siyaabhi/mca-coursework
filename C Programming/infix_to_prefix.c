converting infix to prefix using stack 
#include<stdio.h>
#include<string.h>
char stack[50];
int top=-1;
void push(char ch)
{
    top++;
    stack[top]=ch;
}
char pop()
{
    char ch;
    ch=stack[top];
    top--;
    return ch;
}
int precedence(char ch)
{
    if(ch=='+'||ch=='-')
        return 1;

    if(ch=='*'||ch=='/')
        return 2;

    if(ch=='^')
        return 3;

    return 0;
}
int main()
{
    int i,j=0;
    char infix[50];
    char postfix[50];
    char prefix[50];
    char ch,temp;
    printf("Enter the infix expression: ");
    scanf("%s",infix);
    /* Reverse the infix expression */
    for(i=0,j=strlen(infix)-1;i<j;i++,j--)
    {
        temp=infix[i];
        infix[i]=infix[j];
        infix[j]=temp;
    }
    /* Change brackets */
    for(i=0;infix[i]!='\0';i++)
    {
        if(infix[i]=='(')
            infix[i]=')';
        else if(infix[i]==')')
            infix[i]='(';
    }
    /* Convert to postfix */
    j=0;
    for(i=0;infix[i]!='\0';i++)
    {
        ch=infix[i];

        if((ch>='A'&&ch<='Z') ||
           (ch>='a'&&ch<='z') ||
           (ch>='0'&&ch<='9'))
        {
            postfix[j]=ch;
            j++;
        }
        else if(ch=='(')
        {
            push(ch);
        }
        else if(ch==')')
        {
            while(top!=-1 && stack[top]!='(')
            {
                postfix[j]=pop();
                j++;
            }
            pop();
        }
        else
        {
            while(top!=-1 &&
                  precedence(stack[top])>precedence(ch))
            {
                postfix[j]=pop();
                j++;
            }

            push(ch);
        }
    }

    while(top!=-1)
    {
        postfix[j]=pop();
        j++;
    }

    postfix[j]='\0';

    /* Reverse postfix to get prefix */
    j=0;

    for(i=strlen(postfix)-1;i>=0;i--)
    {
        prefix[j]=postfix[i];
        j++;
    }

    prefix[j]='\0';

    printf("Prefix Expression = %s",prefix);

    return 0;
}
