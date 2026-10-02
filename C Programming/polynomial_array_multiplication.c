#include <stdio.h>
int main()
{
    int p1[20], p2[20], product[40];
    int i, j, n1, n2, max;
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

    for(i = 0; i <= n1 + n2; i++)
    {
        product[i] = 0;
    }
    for(i = 0; i <= n1; i++)
    {
        for(j = 0; j <= n2; j++)
        {
            product[i + j] = product[i + j] + p1[i] * p2[j];
        }
    }
    max = n1 + n2;

    printf("\nProduct of the polynomials is:\n");
    for(i = max; i >= 0; i--)
    {
        if(product[i] != 0)
        {
            if(i == max)
            {
                printf("%dx^%d", product[i], i);
            }
            else if(product[i] > 0)
            {
                printf(" + %dx^%d", product[i], i);
            }
            else
            {
                printf(" - %dx^%d", -product[i], i);
            }
        }
    }
    return 0;
}
