%{
#include<stdio.h>
#include <alloca.h>
#include <math.h>
#include <stdlib.h>
#include <stddef.h>
#include <ctype.h>
#include <string.h>
#define YYSTYPE double
float factorial(int n)
{
  int c;
  float result = 1;
 
  for (c = 1; c <= n; c++)
    result = result * c;
 
  return result;
}

long int bin_dec(long int num)   
{
long int rem,sum=0,power=0;
while(num>0)
 {
 rem = num%10;
 num = num/10;
 sum = sum + rem * pow(2,power);
 power++;
 }

return sum;
}
%}

%token NUMBER MOD RIGHTSHIFT LEFTSHIFT PIVAL
%token PLUS MINUS DIV MUL POW SQRT OPENBRACKET CLOSEBRACKET UNARYMINUS
%token ASIN ACOS ATAN SIN SINH COS COSH TAN TANH INC DEC LAND OR  XOR ASSIGN IOR AND  CEIL FLOOR ABS FACTORIAL BIN_DEC
%left PLUS MINUS MUL DIV UNARYMINUS LAND OR XOR AND IOR LOG
%%
lines	:	lines expr '\n'	{ printf("%g\n", $2); }
	|	lines '\n'
	|
	;
expr:   logicalor
        ;
logicalor: logicaland
        | logicalor OR logicaland
          { $$ = (int) $1 || (int) $3; }
        ;
logicaland: or
        | logicaland LAND or
          { $$ = (int) $1 && (int) $3; }
        ;
or: or1
        | or IOR or1
          { $$ = (int) $1 | (int) $3; }
        ;
or1: and
        | or1 XOR and
          { $$ = (int) $1 ^ (int) $3; }
        ;
and: shift
        | and AND shift
          { $$ = (int) $1 & (int) $3; }
        ;
shift: pow
        | shift LEFTSHIFT pow
          { $$ = (int) $1 << (int) $3; }
        | shift RIGHTSHIFT pow
          { $$ = (int) $1 >>(int) $3; }
        ;
pow: add
        | pow POW add { $$ = pow($1,$3); }
	| SQRT OPENBRACKET expr CLOSEBRACKET { $$ = sqrt($3) ; }
        ;
add: mul
        | add PLUS mul  { $$ = $1 + $3;}
        | add MINUS mul { $$ = $1 - $3; }
        ;
mul: unary
        | mul MUL unary { $$ = $1 * $3; }
        | mul DIV unary { $$ = $1 / $3; }
        | mul MOD unary { $$ = fmod($1,$3); }
        ;
unary: post
        | MINUS primary %prec UNARYMINUS { $$ = -$2; }
        | INC unary { $$ = $2+1; }
        | DEC unary { $$ = $2-1; }
        | LOG unary { $$ = log($2); }
        ;
post   : primary
        | post INC { $$ = $1+1; }
        | post DEC { $$ = $1-1; }
        ;
 primary:
         PIVAL { $$ = M_PI; }
        | OPENBRACKET expr CLOSEBRACKET { $$ = $2; }
        | function
        ;
function: SIN OPENBRACKET expr CLOSEBRACKET
               { $$ = (cos($3)*tan($3)); }
        | COS OPENBRACKET expr CLOSEBRACKET
               { $$ = cos($3); }
	| SINH OPENBRACKET expr CLOSEBRACKET
		{ $$ = sinh($3); }
        | ASIN OPENBRACKET expr CLOSEBRACKET
               { $$ = asin($3); }
        | ACOS OPENBRACKET expr CLOSEBRACKET
               { $$ = acos($3); }
        | ATAN OPENBRACKET expr CLOSEBRACKET
               { $$ = atan($3);}
        | TAN OPENBRACKET expr CLOSEBRACKET
               { $$ = tan($3);}
        | COSH OPENBRACKET expr CLOSEBRACKET
               { $$ = cosh($3);}
        | TANH OPENBRACKET expr CLOSEBRACKET
               { $$ = tanh($3);}
	| CEIL OPENBRACKET expr CLOSEBRACKET
		{ $$ = ceil($3);}
	| FLOOR OPENBRACKET expr CLOSEBRACKET
		{ $$ = floor($3);}
	| ABS OPENBRACKET expr CLOSEBRACKET
		{ $$ = abs($3);}
	| FACTORIAL OPENBRACKET expr CLOSEBRACKET
		{ $$ = factorial((int)$3);}
	| BIN_DEC OPENBRACKET expr CLOSEBRACKET
		{ $$ = bin_dec((float)$3);}
	| NUMBER 
        ;
%%

#include <stdio.h>
#include <ctype.h>
#include "lex.yy.c"
#include <string.h>
char *progname;
yyerror( s )
char *s;
{
  warning( s , ( char * )0 );
  yyparse();
}

warning( s , t )
char *s , *t;
{
  fprintf( stderr ,"%s: %s\n" , progname , s );
  if ( t )
    fprintf( stderr , " %s\n" , t );
}
