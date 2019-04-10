# Requisitos del servidor

El marco Laravel tiene algunos requisitos de sistema.

- PHP >= 7.1.3
- OpenSSL PHP Extension
- PDO PHP Extension
- Mbstring PHP Extension
- Tokenizer PHP Extension
- Memcache PHP Extension

## Tecnologías

* [Laravel] - es un framework de aplicaciones web.
* [Git] - software de control de versiones.
* [Bootstrap] - framework que permite crear interfaces web con CSS y JavaScript.
* [node.js] - evented I/O para el backend.
* [Webpack] - sistema de construcción.
* [jQuery] - biblioteca multiplataforma de JavaScript.

## Documentacion de implementacion de Homestead en proyecto weirdolabs
Documentación oficial para instalar [Laravel Homestead](https://laravel.com/docs/5.2/homestead)

## Documentacion de implementacion de Docker en proyecto weirdolabs

### Configuracion Inicial

Agregar lo siguiente al archivo `hosts` de la maquina:

* 127.0.0.1    weirdolabs.test
* 127.0.0.1    adminer.weirdolabs.test
* 127.0.0.1    mailhog.weirdolabs.test
* 127.0.0.1    portainer.weirdolabs.test

Puertos:
* 8080: Dashboard de Traefik.
* 13306: Puerto de conexion directa a MariaDB.

### Comandos Utilitarios

* `./cmd.sh [-c|--container container_name] [-r] [-u user] [comandos]`:
 Ejecuta los `[comandos]` en un contenedor. Asume el contenedor `php` por defecto 
 y se especifica con `-c|--container`. `-r` especifica usuario `root` y `-u|--user` permite especificar un usuario arbitrario.
 
    Ejemplos:
     
    * `./cmd.sh -c node npm install --verbose` 
    * `./cmd.sh -r php artisan db:seed`.
* `./shell.sh [contenedor]`: Ejecuta el shell del `[contenedor]`. Si no se especifica
asume el contenedor `php`.
* `init.sh`: Inicializa los contenedores y la aplicacion de Laravel.
* `./up.sh`: Levanta los contenedores, atajo para `docker-compose up -d`.
* `./resetdb.sh`: Borra la base de datos, corre las migraciones y reinicializa los datos.

**Software libre!**

[Git]: <https://git-scm.com/>
[Laravel]: <https://laravel.com/docs/5.2/installation>
[Bootstrap]: <http://getbootstrap.com/>
[node.js]: <http://nodejs.org>
[Webpack]: <https://webpack.js.org/>
[jQuery]: <http://jquery.com>