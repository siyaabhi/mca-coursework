#include<stdio.h>
int main()
{
int decimalno,binary[20],i=0;
{
	printf("enter a decimal number to convert:");
	scanf("%d",&decimalno);
	while(decimalno > 0 )
	{
		binary[i] = decimalno % 2;
		decimalno = decimalno/2;
		i++;
	}
	printf("binary number is :");
	for ( i=i-1;i>=0;i--)
	{
		printf("%d",binary[i]);
		}	
		return 0;
	}
}
