# Usar uma imagem base com Maven e JDK
FROM maven:3.9-amazoncorretto-21 AS build

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o pom.xml e o diretório src para o container
COPY pom.xml .
COPY src ./src

# Compilar a aplicação
RUN mvn clean package -DskipTests

# Usar uma imagem mais leve para o runtime
FROM openjdk:21-jdk-slim

# Definir o diretório de trabalho
WORKDIR /app

# Copiar o JAR da aplicação do estágio de build
COPY --from=build /app/target/TP2DevOps-0.0.1-SNAPSHOT.jar app.jar

# Expor a porta da aplicação
EXPOSE 8080

# Comando para executar a aplicação
ENTRYPOINT ["java", "-jar", "app.jar"]