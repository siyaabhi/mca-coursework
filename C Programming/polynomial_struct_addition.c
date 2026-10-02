 Add two polynomials

#include<stdio.h>
struct polynomial
{
    int coeff;
    int exp;
};
int main()
{
    struct polynomial p1[20], p2[20], sum[40];
    int n1, n2, n3;
    int i, j, k;
    printf("Enter number of terms in first polynomial: ");
    scanf("%d", &n1);
    printf("Enter coefficient and exponent:\n");
    for (i = 0; i < n1; i++)
    {
        scanf("%d %d", &p1[i].coeff, &p1[i].exp);
    }
    printf("Enter number of terms in second polynomial: ");
    scanf("%d", &n2);
    printf("Enter coefficient and exponent:\n");
    for (i = 0; i < n2; i++)
    {
        scanf("%d %d", &p2[i].coeff, &p2[i].exp);
    }
    i = 0;
    j = 0;
    k = 0;
    while (i < n1 && j < n2)
    {
        if (p1[i].exp == p2[j].exp)
        {
            sum[k].coeff = p1[i].coeff + p2[j].coeff;
            sum[k].exp = p1[i].exp;
            i++;
            j++;
            k++;
        }
        else if (p1[i].exp > p2[j].exp)
        {
            sum[k] = p1[i];
            i++;
            k++;
        }
        else
        {
            sum[k] = p2[j];
            j++;
            k++;
        }
    }
    while (i < n1)
    {
        sum[k] = p1[i];
        i++;
        k++;
    }
    while (j < n2)
    {
        sum[k] = p2[j];
        j++;
        k++;
    }
    n3 = k;
    printf("\nFirst Polynomial = ");
    for (i = 0; i < n1; i++)
    {
        printf("%dx^%d", p1[i].coeff, p1[i].exp);

        if (i < n1 - 1)
            printf(" + ");
    }
    printf("\nSecond Polynomial = ");
    for (i = 0; i < n2; i++)
    {
        printf("%dx^%d", p2[i].coeff, p2[i].exp);

        if (i < n2 - 1)
            printf(" + ");
    }
    printf("\nSum = ");
    for (i = 0; i < n3; i++)
    {
        printf("%dx^%d", sum[i].coeff, sum[i].exp);

        if (i < n3 - 1)
            printf(" + ");
    }
    return 0;
}

