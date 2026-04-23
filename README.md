# Desenvolvimento Java 21
- Repositório base para uso em disciplinas de desenvolvimento de software
- Configurado para desenvolvimento em Java21
- Pensado para ser usado como "Monorepo" para uma série de projetos de aula
- As instruções a seguir referem-se ao uso deste repositório em conjunto com o CodeSpaces

## Criação de Projetos Java Básicos
O script "create-project.sh" cria um projeto Maven/Java básico para ser usado em disciplinas de algoritmos e programação
- Para que o uso deste script seja possível é necessário que o mesmo tenha permissão de execução. Antes de usar o script pela primeira vez use o comando: `chmod +x create-project.sh`
- Para criar um projeto usando o script use o comando: `./create-project.sh com.exemplo meu-projeto`
- Para compilar e executar o projeto use as opções do VSCode

## Criação de projetos usando Vaadin
O script "create-vaadin-project.sh" cria um projeto Maven/Spring-Boot/Vaadin para ser usado em disciplinas de programação
- Para que o uso deste script seja possível é necessário que o mesmo tenha permissão de execução. Antes de usar o script pela primeira vez use o comando: `chmod +x create-vaadin-project.sh`
- Para criar um projeto usando o script use o comando: `./create-vaadin-project.sh com.exemplo meu-projeto`
- Para compilar e executar o projeto use o comando: `mvn spring-boot:run`

## Criação de projetos SpringBoot
- Use o plugin de criação de projetos Spring-Boot do VSCode
