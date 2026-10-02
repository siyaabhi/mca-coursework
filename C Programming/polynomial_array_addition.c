#include <stdio.h>
int main()
{
    int p1[20], p2[20], sum[20];
    int i, n1, n2, max;
    printf("Enter the degree of first polynomial: ");
    scanf("%d", &n1);
    printf("Enter the coefficients:\n");
    for(i = 0; i <= n1; i++)
    {
        printf("Coefficient of x^%d is: ", i);
        scanf("%d", &p1[i]);
    }

    printf("Enter the degree of second polynomial: ");
    scanf("%d", &n2);
    printf("Enter the coefficients:\n");
    for(i = 0; i <= n2; i++)
    {
        printf("Coefficient of x^%d is: ", i);
        scanf("%d", &p2[i]);
    }

    if(n1 > n2)
    {
        for(i = n2 + 1; i <= n1; i++)
        {
            p2[i] = 0;
        }
        max = n1;
    }
    else
    {
        for(i = n1 + 1; i <= n2; i++)
        {
            p1[i] = 0;
        }
        max = n2;
    }

    for(i = 0; i <= max; i++)
    {
        sum[i] = p1[i] + p2[i];
    }

    printf("\nSum of the polynomials is:\n");

    for(i = max; i >= 0; i--)
    {
        printf("%dx^%d", sum[i], i);

        if(i != 0)
        {
            printf(" + ");
        }
    }
    return 0;
}
