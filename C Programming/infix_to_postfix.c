//Convert an Infix Expression to Postfix Expression 
#include<stdio.h> 
char stack[50]; 
int top=-1; 
void push(char ch) { 
top++; 
stack[top]=ch; 
}  
char pop() { 
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
void main() 
{ 
int i ,j=0; 
char infix[50]; 
char postfix[50]; 
char ch; 
printf("Enter the infix expression: "); 
scanf("%s",infix); 
for(i=0;infix[i]!='\0';i++) 
{ 
ch=infix[i]; 
if((ch>='A'&&ch<='Z')||(ch>='a'&&ch<='z')||(ch>='0'&&ch<='9')) 
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
while(top!=-1&&stack[top]!='(') 
{ 
postfix[j]=pop(); 
j++; 
} 
pop(); 
} 
else 
{ 
while(top!=-1&&precedence(stack[top])>=precedence(ch)) 
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
printf("Postfix Expression = %s",postfix); 
}