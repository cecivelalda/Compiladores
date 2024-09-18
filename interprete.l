%{
    #include "interprete.tab.h" // Importar el archivo de tokens generado por YACC
%}

%%

PLANTAR      { return PLANTAR; }
DONAR        { return DONAR; }
VOLUNTARIO   { return VOLUNTARIO; }
[a-zA-Z]+    { yylval.str = strdup(yytext); return NOMBRE; }
[0-9]+       { yylval.num = atoi(yytext); return NUM; }
[0-9]{4}-[0-9]{2}-[0-9]{2}  { yylval.str = strdup(yytext); return FECHA; }

\n           { return '\n'; }
[ \t]        { /* Ignorar espacios en blanco */ }
.            { /* Ignorar cualquier otro carácter */ }

%%

int yywrap() {
    return 1;
}
