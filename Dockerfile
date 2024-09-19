# Usa una imagen base de Linux
FROM ubuntu:latest

# Instala las dependencias necesarias (gcc, lex, yacc)
RUN apt-get update && apt-get install -y \
    gcc \
    flex \
    bison \
    make

# Crea un directorio de trabajo
WORKDIR /usr/src/app

# Copia los archivos del proyecto al contenedor
COPY . .

# Compila el proyecto usando lex y yacc
RUN lex interprete.l && yacc -d interprete.y && gcc lex.yy.c interprete.tab.c -o interprete

# Establece el comando por defecto cuando se ejecute el contenedor
CMD ["./interprete"]
