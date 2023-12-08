# Api REST

#### Especificaciones
- Servidor: localhost
- Autor: Alexis Miños
- Versión: 1.0.0

#### Requerimientos
- Node.js v18.16.1
- MySQL 8.0
- GIT v2.40.1
- IDE - Visual Studio Code v1.78.2

#### Estructura de directorios
``` tree
    ├── node_modules
    ├── src
    │   ├── connection
    │   │       └connection.js
    │   ├── models
    │   │       ├catalogo.js
    │   │       ├genero.js
    │   │       └vistas.js
    │   ├── routes
    │   │       ├actricesyactores.js
    │   │       ├catalogos.js
    │   │       ├categorias.js
    │   │       └genero.js
    │   └── server.js
    ├── .env.dist
    ├── .gitignore
    ├── creacion de BBDD,carga de datos  y creacion de vistas.sql
    ├── connection_db.js
    ├── package.json
    ├── package-lock.json 
    ├── README.md
    └── vistas de las tablas con sus relaciones.pdf
```

---
### CONFIGURACION DE ENTORNO
  - #### VARIABLES DE ENTORNO
    Se debe hacer una copia del archivo **.env.dist** y renombrarlo como **.env**. Con respecto a su contenido, es necesario asignar los valores a correspondientes a las variables:
    ``` js
    


        
        
        PORT='SERVER_PORT'
        DATABASE=trailerflix
        configuracion con su cuenta de MySQL
        DBUSER= 'DB_USER'
        PASSWORD= 'DB_PASS'
    ```

    
---
### MÓDULO DE BBDD

Este módulo permite la peticion de informacion de la bbdd. El mismo, ofrece funciones para ingresar a la informacion de la bbdd.

#### Métodos HTTP
| Tipo | URI| Descripción |
|------|-----|-------------|
| GET | localhost/8008/catalogo | Obtiene los registros de todo el catalogo de la bbdd |
| GET | localhost/8008/catalogo/:id | Obtiene un registro en específico del catalogo de la bbdd |
| GET | localhost/8008/catalogo/nombre/:nombre | Obtiene uno o mas registros por el nombre del catalogo de la bbdd |
| GET | localhost/8008/catalogo/:id | Obtiene un registro en específico del catalogo de la bbdd |
| GET | localhost/8008/catalogo/:id | Obtiene un registro en específico del catalogo de la bbdd |
| GET | localhost/8008/categoria | Obtiene los registros de la bbdd por categoria |
| GET | localhost/8008/categoria/series | Obtiene el registros de la bbdd por la categoria serie |
| GET | localhost/8008/categoria/peliculas | Obtiene el registros de la bbdd por la categoria peliculas |
| GET | localhost/8008/actricesyactores | Obtiene el registros de las actrices y actores de las peliculas en la bbdd |
| GET | localhost/8008/genero | Obtiene el registros de la bbdd por el genero |


#### Método GET en catalogos:

- Response:
    ``` json
        [
            {
                "id": 3,
                "poster": "https://trailerflix/public/posters/3.jpg",
                "titulo": "The Mandalorian",
                "categoria": "Serie",
                "genero": "Ciencia Ficción, Fantasía",
                "resumen": "Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.",
                "temporadas": 2,
                "reparto": "Pedro Pascal, Carl Weathers, Misty Rosas, Chris Bartlett, Rio Hackford, Giancarlo Esposito",
                "trailer": "https://www.youtube.com/embed/aOC8E8z_ifw"
            },
            .....
        ]
    ```
  - Código HTTP: **200** *catalogo*
  - Código HTTP: **404** *No se encontraron elementos en el catálogo*
  - Código HTTP: **500** *Error al recuperar el catálogo*


#### Método GET en catalogos - Específico:
- Request:
  - Parámetro obligatorio de tipo URL:
    - 9 *(tipo: integer. Indica el código del catalago que se requiere obtener)*
- Response:
    ``` json
        [
            {
                "id": 3,
                "poster": "https://trailerflix/public/posters/3.jpg",
                "titulo": "The Mandalorian",
                "categoria": "Serie",
                "genero": "Ciencia Ficción, Fantasía",
                "resumen": "Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.",
                "temporadas": 2,
                "reparto": "Pedro Pascal, Carl Weathers, Misty Rosas, Chris Bartlett, Rio Hackford, Giancarlo Esposito",
                "trailer": "https://www.youtube.com/embed/aOC8E8z_ifw"
            },
        ]
    ```
  - Código HTTP: **200** *catalogo*
  - Código HTTP: **400** *ID inválido*
  - Código HTTP: **404** *No se encontró un catálogo con el ID*
  - Código HTTP: **500** *Error al recuperar el catálogo por ID*

  #### Método GET en catalogos - nombre:
- Request:
  - Parámetro obligatorio de tipo URL:
    - The Mandalorian *(tipo: string. Indica el titulo del catalago que se requiere obtener)*
- Response:
    ``` json
        [
            {
                "id": 3,
                "poster": "https://trailerflix/public/posters/3.jpg",
                "titulo": "The Mandalorian",
                "categoria": "Serie",
                "genero": "Ciencia Ficción, Fantasía",
                "resumen": "Ambientada tras la caída del Imperio y antes de la aparición de la Primera Orden, la serie sigue los pasos de un pistolero solitario en las aventuras que protagoniza en los confines de la galaxia, donde no alcanza la autoridad de la Nueva República.",
                "temporadas": 2,
                "reparto": "Pedro Pascal, Carl Weathers, Misty Rosas, Chris Bartlett, Rio Hackford, Giancarlo Esposito",
                "trailer": "https://www.youtube.com/embed/aOC8E8z_ifw"
            },
        ]
    ```
  - Código HTTP: **200** *Catalogo*
  - Código HTTP: **400** *Nombre inválido o vacío*
  - Código HTTP: **404** *No se hallaron resultados para Título*
  - Código HTTP: **500** *Error al recuperar el catálogo por nombre*

  #### Método GET en catalogos - genero:
- Request:
  - Parámetro obligatorio de tipo URL:
    - Aventura *(tipo: string. Indica el genero del catalago que se requiere obtener)*
- Response:
    ``` json
        [
            {
                "catalogo_id": 8,
                "genero": "Aventura, Sci-Fi, Acción",
            },
            {
                "catalogo_id": 9,
                "genero": "Aventura, Sci-Fi, Acción",
            },
            ....
        ]
    ```
  - Código HTTP: **200** *generos*
  - Código HTTP: **400** *Nombre de género inválido o vacío*
  - Código HTTP: **404**  *No se encontraron registros para el género:*
  - Código HTTP: **500** *Error interno del servidor al recuperar el catálogo por género*

    #### Método GET en catalogos - categoria:
- Request:
  - Parámetro obligatorio de tipo URL:
    - Serie *(tipo: string. Indica la categoria del catalago que se requiere obtener)*
- Response:
    ``` json
        [
            {   "poster": "https://trailerflix/public/posters/1.jpg",
                "temporadas":	4,
                "trailer":	"N/A",
                "catalogo_id":	1,
                "titulo":	"The Crown",
                "categoria_nombre":	"Serie",
                "resumen":	"Este drama narra las rivalidades políticas y el romance de la reina Isabel II, así como los sucesos que moldearon la segunda mitad del siglo XX.",
                "generos":	"Drama, Hechos verídicos",
                "actores":	"Claire Fox, Olivia Colman, Matt Smith, Tobias Menzies, Vanesa Kirby, Helena Bonham Carter",
            },
            {
                "poster":	"https://trailerflix/public/posters/2.jpg",
                "temporadas":	5,
                "trailer":	"N/A",
                "catalogo_id":	2,
               " titulo":	"Riverdale",
                "categoria_nombre":	"Serie",
                "resumen":	"El paso a la edad adulta incluye sexo, romance, escuela y familia. Para Archie y sus amigos, también hay misterios oscuros.",
                "generos":	"Drama, Misterio, Ficción",
                "actores":	"Lili Reinhart, Casey Cott, Camila Mendes, Marisol Nichols, Madelaine Petsch, Mädchen Amick",
            },
            ....
        ]
    ```
  - Código HTTP: **200** *categoria*
  - Código HTTP: **400** *Nombre de categoría inválido o vacío*
  - Código HTTP: **404** *No se hallaron resultados para Categoría:*
  - Código HTTP: **500** *Error interno del servidor al recuperar la categoría*

#### Método GET en categorias:

- Response:
    ``` json
        [
            {
                "id": 3,
                "categoria": "Serie",
            },
            {
                "id": 4,
                "categoria": "Serie",
            },
            .....
            {
                "id": 25,
                "categoria": "peliculas",
            },
            .....
        ]
    ```
  - Código HTTP: **200** *categoriasSimples*
  - Código HTTP: **404**  *No se encontraron categorías*
  - Código HTTP: **500** *Error interno del servidor al recuperar las categorías*


#### Método GET en actricesyactores:
- Request:
  - Parámetro obligatorio de tipo URL:
    - actricesyactores *(tipo: string. Indica el apartado actrices y actores dentro de la tabla actricesyactores)*
- Response:
    ``` json
        [
            {
                "id": 1,
                "reparto": "Pedro Pascal",
            },
            {
                "id": 4,
                "reparto": "Chris Barlett",
            },
            ......
        ]
    ```
  - Código HTTP: **200** *actores*
  - Código HTTP: **404** *No se encontraron actores o actrices*
  - Código HTTP: **500** *Error interno del servidor al intentar encontrar los actores y actrices*

  #### Método GET en genero:
- Request:
  - Parámetro obligatorio de tipo URL:
    - genero *(tipo: string. Indica el apartado genero dentro de la tabla generos)*
- Response:
    ``` json
        [
            {
                "id": 1,
                "genero": "Ciencia Ficción",
            },
            {
                "id": 4,
                "reparto": "Ficción,
            },
            ......
        ]
    ```
  - Código HTTP: **200** *genero*
  - Código HTTP: **404** *No se encontraron géneros disponibles*
  - Código HTTP: **500** *Error interno del servidor al recuperar los géneros*
