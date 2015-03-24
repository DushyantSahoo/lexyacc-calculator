number [0-9]+\.?|[0-9]*\.[0-9]+
%%
[ \t]   { ; }
log     return LOG;
factorial return FACTORIAL;
bin_dec   return BIN_DEC;
pi      return PIVAL;
sin     return SIN;
cos     return COS;
tan     return TAN;
and     return AND;
sinh    return SINH;
cosh    return COSH;
tanh    return TANH;
asin    return ASIN;
acos    return ACOS;
atan    return ATAN;
xor     return XOR;
or      return OR;
ceil    return CEIL;
floor   return FLOOR;
abs     return ABS;
{number}	{ yylval=atof(yytext);return NUMBER; }
"<<"    return LEFTSHIFT;
">>"    return RIGHTSHIFT;
"++"    return INC;
"--"    return DEC;
"+"     return PLUS;
"-"     return MINUS;
"~"     return UNARYMINUS;
"/"     return DIV;
"*"     return MUL;
"^"     return POW;
sqrt    return SQRT;
"("     return OPENBRACKET;
")"     return CLOSEBRACKET;
"%"     return MOD;
"^^"    return XOR;
"="     return ASSIGN;
"&&"    return LAND;
"||"    return OR;
"|"     return IOR;
"&"     return AND;
\n|. {return yytext[0];}
