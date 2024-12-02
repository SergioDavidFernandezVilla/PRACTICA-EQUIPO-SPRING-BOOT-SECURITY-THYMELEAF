# Configuración para Spring Boot en Project IDX
{ pkgs, ... }: {
  # Canal de nixpkgs a utilizar
  channel = "stable-24.05"; 

  # Paquetes necesarios para Spring Boot
  packages = [
    pkgs.jdk21        # JDK 21 para ejecutar y compilar aplicaciones Java
    pkgs.maven        # Maven para gestión de dependencias y construcción del proyecto
    pkgs.git          # Git para control de versiones
  ];

  # Variables de entorno necesarias
  env = {
     # Establecer la variable JAVA_HOME
    # Incluir herramientas en el PATH
  };

  idx = {
    # Extensiones para desarrollo (opcional)
    extensions = [
      "vscjava.vscode-java-pack"  # Extensión de Visual Studio Code para Java
      "pivotal.vscode-spring-boot" # Extensión para soporte de Spring Boot
    ];

    # Previews (puedes configurar para probar tu servidor)
    previews = {
      enable = true;
      previews = {
        web = {
          # Configuración para ejecutar el servidor Spring Boot en el entorno
          command = ["mvn" "spring-boot:run"];
          manager = "web";
          env = {
            # Variables específicas para el servidor
            PORT = "$PORT";
          };
        };
      };
    };

    # Hooks del workspace
    workspace = {
      # Comandos que se ejecutan al crear el workspace
      onCreate = {
        # Descarga las dependencias del proyecto
        maven-dependencies = "mvn dependency:resolve";
      };
      # Comandos que se ejecutan al iniciar el workspace
      onStart = {
        # Compila el proyecto para asegurar que todo esté correcto
        maven-compile = "mvn clean compile";
      };
    };
  };
}
