//Display array elements in reverse order using a recursive function.
#include <stdio.h>
// Recursive function
void reversedisplay(int a[], int n, int i)
{
    if (i == n)
        return;
    reversedisplay(a, n, i + 1);
    printf("%d ", a[i]);
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
    printf("Array elements are: \n");
    reversedisplay(a,n,0);
    return 0;
}

