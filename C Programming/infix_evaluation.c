evaluate an infix expression using stack
#include<stdio.h>
int numstack[50];
char opstack[50];
int ntop=-1;
int otop=-1;
void pushnum(int n)
{
    ntop++;
    numstack[ntop]=n;
}

int popnum()
{
    int n;
    n=numstack[ntop];
    ntop--;
    return n;
}

void pushop(char ch)
{
    otop++;
    opstack[otop]=ch;
}

char popop()
{
    char ch;
    ch=opstack[otop];
    otop--;
    return ch;
}

int precedence(char ch)
{
    if(ch=='+'||ch=='-')
        return 1;

    if(ch=='*'||ch=='/')
        return 2;

    return 0;
}

void calculate()
{
    int a,b,result;
    char op;

    b=popnum();
    a=popnum();
    op=popop();

    if(op=='+')
        result=a+b;
    else if(op=='-')
        result=a-b;
    else if(op=='*')
        result=a*b;
    else if(op=='/')
        result=a/b;

    pushnum(result);
}

int main()
{
    char exp[50],ch;
    int i,num;

    printf("Enter infix expression: ");
    scanf("%s",exp);

    for(i=0;exp[i]!='\0';i++)
    {
        ch=exp[i];

        if(ch>='0' && ch<='9')
        {
            num=ch-'0';
            pushnum(num);
        }

        else if(ch=='(')
        {
            pushop(ch);
        }

        else if(ch==')')
        {
            while(opstack[otop]!='(')
                calculate();
            popop();
        }

        else
        {
            while(otop!=-1 &&
                  opstack[otop]!='(' &&
                  precedence(opstack[otop])>=precedence(ch))
            {
                calculate();
            }
            pushop(ch);
        }
    }

    while(otop!=-1)
    {
        calculate();
    }

    printf("Result = %d",numstack[ntop]);

    return 0;
}
