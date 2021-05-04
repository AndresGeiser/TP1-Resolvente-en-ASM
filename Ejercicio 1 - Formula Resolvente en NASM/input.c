
#include <stdio.h>

extern double cuadratica( double, double, double, double *, double *);

int main()
{
  double a,b,c, raiz1, raiz2;

  printf("\n\t\tTP1 - Formula Resolvente");
  printf("\n\t\t_________________________________________\n\n\n");
  printf("\t\t\tIngresa el valor de a --> ");
  scanf("%lf", &a);
  while(a==0){
  printf("\t\tEl valor de a no puede ser 0, ingresa nuevamente -->");
  scanf("%lf", &a);
  }
  printf("\t\t\tIngresa el valor de b --> ");
  scanf("%lf", &b);
  printf("\t\t\tIngresa el valor de c --> ");
  scanf("%lf", &c);

  if (cuadratica( a, b, c, &raiz1, &raiz2) )
    printf("\n\n\t\t\tLas Raices son: %.10g y %.10g\n", raiz1, raiz2);
  printf("\n\t\t_________________________________________\n\n\n");
  return 0;
}