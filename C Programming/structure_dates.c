#include<stdio.h>
struct Date{
	int dd;
	int mm;
	int yyyy;
};
void readDate(struct Date * d)
{
scanf("%d/%d/%d", &d->dd, &d->mm, &d->yyyy);
}
void displayDate(struct Date * d)
{
printf("%d/%d/%d", d->dd, d->mm, d->yyyy);
}
void compare(struct Date d1, struct Date d2) {
    if (d1.dd == d2.dd &&
        d1.mm == d2.mm &&
        d1.yyyy == d2.yyyy)
        printf("\nDates are equal.");
    else
        printf("\nDates are not equal.");
}
int main() {
    struct Date d1, d2;
    printf("Enter first date: ");
    readDate(&d1);
    printf("Enter second date: ");
    readDate(&d2);
    printf("\nFirst date: ");
    displayDate(&d1);
    printf("\nSecond date: ");
    displayDate(&d2);
    compare(d1, d2);

    return 0;
}
