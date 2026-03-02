#!/bin/bash

if [ $# -lt 2 ]; then
  echo "Uso: $0 <groupId> <artifactId>"
  echo "Exemplo: $0 com.exemplo vaadin-app"
  exit 1
fi

GROUP_ID=$1
ARTIFACT_ID=$2
PACKAGE_DIR=$(echo "$GROUP_ID" | tr '.' '/')
BASE_DIR=$ARTIFACT_ID
SRC_MAIN_JAVA="$BASE_DIR/src/main/java/$PACKAGE_DIR"

echo "Criando projeto Vaadin + Spring Boot '$ARTIFACT_ID' com Java 21..."

mkdir -p "$SRC_MAIN_JAVA"

# pom.xml corrigido
cat > "$BASE_DIR/pom.xml" << EOF
<project xmlns="http://maven.apache.org/POM/4.0.0" 
         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 
                             http://maven.apache.org/xsd/maven-4.0.0.xsd">
  <modelVersion>4.0.0</modelVersion>

  <groupId>$GROUP_ID</groupId>
  <artifactId>$ARTIFACT_ID</artifactId>
  <version>1.0-SNAPSHOT</version>
  <packaging>jar</packaging>

  <properties>
    <java.version>21</java.version>
    <vaadin.version>24.3.7</vaadin.version>
    <spring-boot.version>3.2.5</spring-boot.version>
  </properties>

  <dependencyManagement>
    <dependencies>
      <dependency>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-dependencies</artifactId>
        <version>\${spring-boot.version}</version>
        <type>pom</type>
        <scope>import</scope>
      </dependency>
    </dependencies>
  </dependencyManagement>

  <dependencies>
    <dependency>
      <groupId>org.springframework.boot</groupId>
      <artifactId>spring-boot-starter-web</artifactId>
    </dependency>

    <dependency>
      <groupId>com.vaadin</groupId>
      <artifactId>vaadin-spring-boot-starter</artifactId>
      <version>\${vaadin.version}</version>
    </dependency>
  </dependencies>

  <build>
    <plugins>
      <plugin>
        <groupId>org.springframework.boot</groupId>
        <artifactId>spring-boot-maven-plugin</artifactId>
        <version>\${spring-boot.version}</version>
      </plugin>

      <plugin>
        <groupId>org.apache.maven.plugins</groupId>
        <artifactId>maven-compiler-plugin</artifactId>
        <version>3.11.0</version>
        <configuration>
          <release>\${java.version}</release>
        </configuration>
      </plugin>
    </plugins>
  </build>
</project>
EOF

# Classe principal com main()
cat > "$SRC_MAIN_JAVA/App.java" << EOF
package $GROUP_ID;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class App {
    public static void main(String[] args) {
        SpringApplication.run(App.class, args);
    }
}
EOF

# View básica do Vaadin
cat > "$SRC_MAIN_JAVA/MainView.java" << EOF
package $GROUP_ID;

import com.vaadin.flow.component.button.Button;
import com.vaadin.flow.component.orderedlayout.VerticalLayout;
import com.vaadin.flow.router.Route;

@Route("")
public class MainView extends VerticalLayout {
    public MainView() {
        add(new Button("Clique aqui", e -> add("Olá, mundo!")));
    }
}
EOF

# README
cat > "$BASE_DIR/README.md" << EOF
# $ARTIFACT_ID

Projeto básico com **Vaadin 24 + Spring Boot 3.2** e Java 21.

## Como compilar e rodar

\`\`\`bash
cd $ARTIFACT_ID
mvn clean install
mvn spring-boot:run

\`\`\`
EOF

echo "Projeto '$ARTIFACT_ID' criado com sucesso com Vaadin + Spring Boot e Java 21."
