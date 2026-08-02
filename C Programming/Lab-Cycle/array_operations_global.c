//Use a menu-driven program to insert, search, delete and sort elements in an array using functions (use global variables) 
#include<stdio.h>
int a[10], n, i;
int main()
{
    int ch;
    printf("Enter the size of the array: ");
    scanf("%d", &n);
    printf("Enter the elements:\n");
    for(i = 0; i < n; i++)
    {
        scanf("%d", &a[i]);
    }
    do
    {
         printf("\n----- MENU -----\n");
        printf("1. Insert\n");
        printf("2. Search\n");
        printf("3. Delete\n");
        printf("4. Sort\n");
        printf("5. Display\n");
        printf("6. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &ch);
        switch(ch)
        {
            case 1:
                insertelement();
                break;
            case 2:
                search();
                break;
            case 3:
                deleteelement();
                break;
            case 4:
                sort();
                break;
            case 5:
                display();
                break;
            case 6:
                printf("Exiting...\n");
                break;
            default:
                printf("Invalid choice!\n");
        }
    } while(ch != 6);
}
void insertelement()
{
    if(n == 10)
    {
        printf("Array is full!\n");
        return;
    }
   printf("Enter the element to insert: ");
    scanf("%d", &a[n]);
    n++;
    printf("Element inserted successfully.\n");
}
void search()
{
    int s, flag = 0;
    printf("Enter the element to search: ");
    scanf("%d", &s);
    for(i = 0; i < n; i++)
    {
        if(a[i] == s)
        {
            printf("Element found at position %d\n", i);
            flag = 1;
            break;
        }
    }
    if(flag == 0)
        printf("Element not found.\n");
}
void deleteelement()
{
    int d, j, flag = 0;

    printf("Enter the element to delete: ");
    scanf("%d", &d);
    for(i = 0; i < n; i++)
    {
        if(a[i] == d)
        {
            for(j = i; j < n - 1; j++)
            {
                a[j] = a[j + 1];
            }
            n--;
            flag = 1;
            printf("Element deleted successfully.\n");
            break;
        }
    }
    if(flag == 0)
        printf("Element not found.\n");
}
void sort()
{
    int j, temp;

    for(i = 0; i < n - 1; i++)
    {
        for(j = i + 1; j < n; j++)
        {
            if(a[i] > a[j])
            {
                temp = a[i];
                a[i] = a[j];
                a[j] = temp;
            }
        }
    }
    printf("Array sorted successfully.\n");
}
void display()
{
    printf("Array elements are:\n");

    for(i = 0; i < n; i++)
    {
        printf("%d ", a[i]);
    }

    printf("\n");
}
