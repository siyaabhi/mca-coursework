Determinant of a  2x2 matrix
    #include <stdio.h>
int main()
{
    int a[2][2];
    int det;
    int i, j;
    printf("Enter 2x2 matrix:\n");
    for (i = 0; i < 2; i++)
    {
        for (j = 0; j < 2; j++)
        {
            scanf("%d", &a[i][j]);
        }
    }
    det = a[0][0] * a[1][1]
        - a[0][1] * a[1][0];
    printf("Determinant = %d", det);
    return 0;
}
