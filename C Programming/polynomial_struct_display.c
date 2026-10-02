read and display polynomial
#include <stdio.h>
struct polynomial
{
    int coeff;
    int exp;
};
int main()
{
    struct polynomial p[20];
    int n, i;
    printf("Enter number of terms: ");
    scanf("%d", &n);
    printf("Enter coefficient and exponent of each term:\n");
    for (i = 0; i < n; i++)
    {
        scanf("%d %d", &p[i].coeff, &p[i].exp);
    }
    printf("Polynomial = ");
    for (i = 0; i < n; i++)
    {
        if (i > 0 && p[i].coeff >= 0)
            printf("+");
        if (p[i].exp == 0)
            printf("%d", p[i].coeff);
        else if (p[i].exp == 1)
            printf("%dx", p[i].coeff);
        else
            printf("%dx^%d", p[i].coeff, p[i].exp);
    }
    return 0;
}
