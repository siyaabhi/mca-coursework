// sparse matrix addition
#include<stdio.h> 
void main() 
{ 
int a[10][10],b[10][10],c[10][10]; 
int t1[20][3],t2[20][3],t3[40][3]; 
int row,col; 
int i,j,k,l,m,n; 
printf("Enter number of rows: "); 
scanf("%d",&row); 
printf("Enter number of columns: "); 
scanf("%d",&col); 
printf("Enter first sparse matrix:\n"); 
for(i=0;i<row;i++) 
{ 
for(j=0;j<col;j++) 
{ 
scanf("%d",&a[i][j]); 
} 
} 
printf("Enter second sparse matrix:\n"); 
for(i=0;i<row;i++) 
{ 
for(j=0;j<col;j++) 
{ 
scanf("%d",&b[i][j]); 
} 
} 
k=1; 
for(i=0;i<row;i++) 
{ 
for(j=0;j<col;j++) 
{ 
if(a[i][j]!=0) 
{ 
t1[k][0]=i; 
t1[k][1]=j; 
t1[k][2]=a[i][j]; 
k++; 
} 
} 
} 
t1[0][0]=row; 
t1[0][1]=col; 
t1[0][2]=k-1; 
l=1; 
for(i=0;i<row;i++) 
{ 
for(j=0;j<col;j++) 
{ 
if(b[i][j]!=0) 
{ 
t2[l][0]=i; 
t2[l][1]=j; 
t2[l][2]=b[i][j]; 
l++; 
} 
} 
} 
t2[0][0]=row; 
t2[0][1]=col; 
t2[0][2]=l-1; 
for(i=0;i<row;i++) 
{ 
for(j=0;j<col;j++) 
{ 
c[i][j]=a[i][j]+b[i][j]; 
} 
} 
 
m=1; 
for(i=0;i<row;i++) 
{ 
for(j=0;j<col;j++) 
{ 
if(c[i][j]!=0) 
{ 
t3[m][0]=i; 
t3[m][1]=j; 
t3[m][2]=c[i][j]; 
m++; 
} 
} 
} 
t3[0][0]=row; 
t3[0][1]=col; 
t3[0][2]=m-1; 
printf("\nFirst Matrix in 3-Tuple Form:\n"); 
for(i=0;i<k;i++) 
{ 
printf("%d %d %d\n",t1[i][0],t1[i][1],t1[i][2]); 
} 
printf("\nSecond Matrix in 3-Tuple Form:\n"); 
for(i=0;i<l;i++) 
{ 
printf("%d %d %d\n",t2[i][0],t2[i][1],t2[i][2]); 
} 
printf("\nResultant 3-Tuple:\n"); 
for(i=0;i<m;i++) 
{ 
printf("%d %d %d\n",t3[i][0],t3[i][1],t3[i][2]); 
} 
printf("\nResultant Sparse Matrix:\n"); 
for(i=0;i<row;i++) 
{ 
for(j=0;j<col;j++) 
{ 
printf("%d ",c[i][j]); 
} 
printf("\n"); 
} 
}