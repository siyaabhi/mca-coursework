//Sort the array elements in ascending order (minimum three functions: read, disp and sort) 
#include<stdio.h>
// Function to read array elements
void read(int a[], int n)
{
    int i;
    printf("Enter the array elements:\n");
    for(i = 0; i < n; i++)
    {
        scanf("%d", &a[i]);
    }
}
// Function to sort the array in ascending order
void sort(int a[], int n)
{
    int i, j, temp;
    for(i = 0; i < n - 1; i++)
    {
        for(j = 0; j < n - i - 1; j++)
        {
            if(a[j] > a[j + 1])
            {
                temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
            }
        }
    }
}
// Function to display sorted array
void display(int a[], int n)
{
    int i;
    printf("Array in ascending order:\n");
    for(i = 0; i < n; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
}
int main()
{
    int a[100], n;
    printf("Enter the number of elements: ");
    scanf("%d", &n);
    read(a, n);
    sort(a, n);
    display(a, n);
    return 0;
}

