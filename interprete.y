%{
    #include <stdio.h>
    #include <stdlib.h>
    
    // Declarar la función yylex
    int yylex(void);
    
    // Declarar yyerror para evitar advertencias
    void yyerror(const char *s);
%}


%union {
    char* str; // Para los nombres y fechas
    int num;   // Para los números
}

%token <str> NOMBRE FECHA
%token <num> NUM
%token PLANTAR DONAR VOLUNTARIO

%%

input:
      | input line
      ;

line:
      PLANTAR NOMBRE NOMBRE FECHA { printf("Plantar árbol %s en %s el %s\n", $2, $3, $4); }
    | DONAR NOMBRE NUM FECHA       { printf("Donación de %d por %s el %s\n", $3, $2, $4); }
    | VOLUNTARIO NOMBRE NOMBRE     { printf("Voluntario %s registrado con correo %s\n", $2, $3); }
    | '\n'
    ;

%%

int main() {
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
