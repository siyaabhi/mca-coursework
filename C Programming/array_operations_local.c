//Use a menu-driven program to insert, search, delete and sort elements in an array using functions (use only local variables) 
 #include<stdio.h>
// Function to insert an element
void insert(int a[], int *n)
{
    int i, pos, value;
    printf("Enter position: ");
    scanf("%d", &pos);
    if (pos < 1 || pos > *n + 1)
    {
        printf("Invalid position!\n");
        return;
    }
    printf("Enter value: ");
    scanf("%d", &value);
    for (i = *n; i >= pos; i--)
    {
        a[i] = a[i - 1];
    }
    a[pos - 1] = value;
    (*n)++;
    printf("Element inserted.\n");
}

// Function to search an element
void search(int a[], int n)
{
    int i, value, found = 0;
    printf("Enter value to search: ");
    scanf("%d", &value);
    for (i = 0; i < n; i++)
    {
        if (a[i] == value)
        {
            printf("Element found at position %d\n", i + 1);
            found = 1;
            break;
        }
    }
    if (found == 0)
    {
        printf("Element not found.\n");
    }
}
// Function to delete an element
void deleteElement(int a[], int *n)
{
    int i, pos;
    printf("Enter position to delete: ");
    scanf("%d", &pos);
    if (pos < 1 || pos > *n)
    {
        printf("Invalid position!\n");
        return;
    }
    for (i = pos - 1; i < *n - 1; i++)
    {
        a[i] = a[i + 1];
    }
    (*n)--;
    printf("Element deleted.\n");
}
// Function to sort the array
void sort(int a[], int n)
{
    int i, j, temp;
    for (i = 0; i < n - 1; i++)
    {
        for (j = 0; j < n - i - 1; j++)
        {
            if (a[j] > a[j + 1])
            {
                temp = a[j];
                a[j] = a[j + 1];
                a[j + 1] = temp;
            }
        }
    }
    printf("Array sorted.\n");
}
// Function to display the array
void display(int a[], int n)
{
    int i;
    if (n == 0)
    {
        printf("Array is empty.\n");
        return;
    }
    printf("Array elements: ");
    for (i = 0; i < n; i++)
    {
        printf("%d ", a[i]);
    }
    printf("\n");
}
int main()
{
    int a[100], n, i, choice;
    printf("Enter number of elements: ");
    scanf("%d", &n);
    printf("Enter the elements:\n");
    for (i = 0; i < n; i++)
    {
        scanf("%d", &a[i]);
    }
    do
    {
        printf("\n------ MENU ------\n");
        printf("1. Insert\n");
        printf("2. Search\n");
        printf("3. Delete\n");
        printf("4. Sort\n");
        printf("5. Display\n");
        printf("6. Exit\n");
        printf("Enter your choice: ");
        scanf("%d", &choice);
        switch (choice)
        {
            case 1:
                insert(a, &n);
                break;

            case 2:
                search(a, n);
                break;

            case 3:
                deleteElement(a, &n);
                break;

            case 4:
                sort(a, n);
                break;

            case 5:
                display(a, n);
                break;

            case 6:
                printf("Program exited.\n");
                break;
            default:
                printf("Invalid choice!\n");
        }
    } while (choice != 6);
    return 0;
}
