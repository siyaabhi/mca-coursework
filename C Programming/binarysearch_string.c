#include <stdio.h>
#include <string.h>

int main()
{
    char a[10][50], key[50], temp[50];
    int n, i, j;
    int low, high, mid;

    printf("Enter the number of strings: ");
    scanf("%d", &n);

    printf("Enter the strings:\n");
    for(i = 0; i < n; i++)
    {
        scanf("%s", a[i]);
    }

    /* Sorting */
    for(i = 0; i < n - 1; i++)
    {
        for(j = 0; j < n - i - 1; j++)
        {
            if(strcmp(a[j], a[j + 1]) > 0)
            {
                strcpy(temp, a[j]);
                strcpy(a[j], a[j + 1]);
                strcpy(a[j + 1], temp);
            }
        }
    }

    printf("\nSorted strings:\n");
    for(i = 0; i < n; i++)
    {
        printf("%s\n", a[i]);
    }

    printf("\nEnter the string to search: ");
    scanf("%s", key);

    /* Binary Search */
    low = 0;
    high = n - 1;

    while(low <= high)
    {
        mid = (low + high) / 2;

        if(strcmp(a[mid], key) == 0)
        {
            printf("String found at position %d", mid + 1);
            return 0;
        }
        else if(strcmp(key, a[mid]) < 0)
        {
            high = mid - 1;
        }
        else
        {
            low = mid + 1;
        }
    }

    printf("String not found");

    return 0;
}