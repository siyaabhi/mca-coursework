//Display the array elements in the same order using a recursive function 
#include <stdio.h>
// Recursive function
void display(int a[], int n, int i)
{
    if (i == n)
        return;
    printf("%d ", a[i]);
    display(a, n, i + 1);
}
int main()
{
    int a[100], n, i;

    printf("Enter the number of elements: ");
    scanf("%d", &n);
    printf("Enter the array elements:\n");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &a[i]);
    }
    printf("Array elements are:\n");
    display(a, n, 0);
    return 0;
}
