# Seek customer Management

Bienvenido a customer Management, un proyecto desarrollado en Spring Boot con Maven y ejecutable mediante Docker Compose. Esta aplicación gestiona usuarios, cuentas y reportes; ademas, utiliza bases de datos MySQL y Kafka como broker. Sigue estos pasos para ejecutar la aplicación de manera local.

## Requisitos Previos

Asegúrate de tener instalados los siguientes componentes antes de comenzar:

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)
- [Maven](https://maven.apache.org/download.cgi)
- [Postman](https://www.postman.com/downloads/)
- Git (opcional, pero recomendado para clonar el repositorio)

## Organizacion del Proyecto

En la raíz del proyecto [link](https://github.com/Seek-challenges), encontrarás la siguiente estructura de carpetas:


```markdown
- `seek-challenges/`
   - `app-customer/`
   - `component-notification/`
   - `core-customer/`
   - `dev-environment/`
   - `k8s-manifests/`
   - `k8s-secrets/`
   ```

## Colección de Postman

Para facilitar la interacción con la API de Customer Management, he creado una colección de Postman que incluye diversos escenarios y casos de uso. Puedes importar esta colección en tu cliente de Postman siguiendo estos pasos:

1. Descarga el archivo JSON de la colección de Postman desde el siguiente enlace:

   [Colección de Postman JSON](https://github.com/Seek-challenges/dev-environment/blob/main/docs/Seek.postman_collection.json) --

2. Abre Postman y haz clic en la pestaña "Import" en la parte superior izquierda.

3. Selecciona "Paste Raw Text" y pega el contenido copiado.

4. Haz clic en "Import" para agregar la colección a tu entorno de Postman.

### Uso de la Colección

Una vez que hayas importado la colección, podrás acceder a diferentes escenarios. Asegúrate de haber ejecutado mediante Docker Compose antes de probar los endpoints.

¡Explora y prueba la colección para conocer más sobre la API de Customer-Management!

## Configuración DEV

Aunque los `docker-compose.yml` ya estan configurados para su correcto funcionamiento, se recomienda verificar la configuración en el archivo `docker-compose.yml` antes de ejecutar la aplicación. Asegúrate de que las variables de entorno y los puertos sean los adecuados para tu entorno.

```yaml
# docker-compose.yml
...

environment:
   SPRING_PROFILES_ACTIVE: prod
   SPRING_R2DBC_URL: r2dbc:mysql://db:3306/app-db
   SPRING_FLYWAY_URL: jdbc:mysql://db:3306/app-db
ports:
    - "3306:3306"  # Puerto para la base de datos MySQL
    - "8080:8080"  # Puerto para la aplicación Spring Boot

...
```

## Pruebas unitarias y de Integración
Las pruebas unitarias y de integración solicitadas las puedes encontrar en el servicio `app-customer` usando TestContainer, Junit y Mockito

## Ejecución con Docker Compose

Dentro de la carpeta `compose` se encuentran los archivos yaml correspondientes a la infraestructura de la aplicación, puedes ejecutar el aplicativo de dos maneras:

1. **Docker Compose**: Utilizando los archivos `docker-compose.yml` uno a uno para levantar la aplicación y la base de datos en contenedores. Asegurate de tener las networks creadas.

    ```bash
    docker-compose -p discovery -f compose/discovery.yml up -d
    ```

2. **Bash Script**: Utilizando el script `deploy.sh` que se encuentra en el root del proyecto para levantar la aplicación y la base de datos en contenedores.

    ```bash
    chmod 777 deploy.sh
    ./deploy.sh
    ```
La aplicación Spring Boot se ejecutará en el perfil de desarrollo (`dev`) y se expondrá por medio de app-customer en el puerto 8080.

## Detener la Aplicación

Para detener la aplicación y los contenedores, utiliza el siguiente comando:

```bash
chmod 777 down.sh
./down.sh
```

Este comando apagará y eliminará los contenedores.

## Ambiente de Producción

La app en producción se ejecuta en un clúster de Kubernetes usando estrategias de GitOps y CI/CD en github actions:

1. La URI del servidor PROD es `http://ec2-3-14-254-81.us-east-2.compute.amazonaws.com`.
2. La URI de ArgoCd es `http://ec2-3-14-254-81.us-east-2.compute.amazonaws.com:8888`, solicita el usuario y contraseña.

![Diagrama de Arquitectura](https://github.com/Seek-challenges/dev-environment/blob/main/docs/Seek%20Lucidchart.jpeg)


