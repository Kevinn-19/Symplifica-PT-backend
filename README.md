# Prueba Técnica Symplifica-Backend

API REST desarrollada como parte de la prueba técnica de Symplifica.

El backend permite la gestión de empleados y sus beneficios asociados, además de integrar información adicional mediante servicios externos.

La aplicación fue desarrollada utilizando Ruby on Rails y está preparada para ejecutarse mediante Docker.

## Tecnologías utilizadas

- Ruby 4.0
- Ruby on Rails 8
- PostgreSQL
- Docker
- API Rest

## Descripción

La aplicación cuenta con endpoints para:

- Gestión de empleados.
- Creación y consulta de beneficios asociados.
- Consulta de información adicional del empleado mediante una API externa.

## Arquitectura

El backend está desarrollado siguiendo una estructura basada en MVC:

- Controllers: Manejo de solicitudes HTTP y respuestas JSON.
- Models: Representación de entidades y relaciones con la base de datos.
- Services: Encapsulación de lógica externa y funcionalidades reutilizables, en este caso haciendo uso de OpenStreetMap.

## Modelos principales

### Employee

Representa la información de los empleados.

Campos principales:

- nombre
- apellido
- correo
- cargo
- ciudad

Relaciones:

- Un empleado puede tener múltiples beneficios.

### Benefit

Representa los beneficios asociados a un empleado.

Campos principales:

- nombre
- monto
- empleado_id

Relaciones:

- Pertenece a un empleado.

### Diagrama de Base de Datos
<img width="700" height="700" alt="Diagrama BD" src="https://github.com/user-attachments/assets/a52e51e7-7242-4f00-b9c5-d4be1659ae43" />

## API

La aplicación expone una API REST para la gestión de empleados y beneficios.

Base URL: http://localhost:3000/api


---

## Employees

### Obtener empleados

Obtiene la lista completa de empleados registrados.

**Request**

```http 
GET /api/employees
```

**Response**
```
[
  {
    "id": 1,
    "apellido": "Chiquillo Díaz",
    "cargo": "Desarrollador Junior",
    "ciudad": "Bogota",
    "correo": "kchiquillod@gmail.com",
    "created_at": "2026-07-11T18:04:38.859Z",
    "nombre": "Kevin Esteban",
    "updated_at": "2026-07-11T18:04:38.859Z",
    "benefits": [
      {
        "id": 2,
        "created_at": "2026-07-11T18:09:23.278Z",
        "empleado_id": 1,
        "monto": "149999.0",
        "nombre": "Seguro médico",
        "updated_at": "2026-07-11T18:09:23.278Z"
      }
    ]
  }
]
```
### Obtener empleado por ID

Obtiene la información de un empleado específico.

**Request**

```
http GET /api/employees/:id
```

**Response**

```{
  "employee": {
    "id": 1,
    "apellido": "Chiquillo Díaz",
    "cargo": "Desarrollador Junior",
    "ciudad": "Bogota",
    "correo": "kchiquillod@gmail.com",
    "created_at": "2026-07-11T18:04:38.859Z",
    "nombre": "Kevin Esteban",
    "updated_at": "2026-07-11T18:04:38.859Z"
  },
  "benefits": [
    {
      "id": 2,
      "created_at": "2026-07-11T18:09:23.278Z",
      "empleado_id": 1,
      "monto": "149999.0",
      "nombre": "Seguro médico",
      "updated_at": "2026-07-11T18:09:23.278Z"
    }
  ],
  "location": {
    "latitude": "4.6533817",
    "longitude": "-74.0836331",
    "display_name": "Bogotá, Bogotá, Distrito Capital, RAP (Especial) Central, Colombia"
  }
}
```

## Crear empleado

Permite registrar un nuevo empleado en el sistema.

**Request**

```http
POST /api/employees
```
**Body**
```
{
  "nombre": "Kevin Esteban",
  "apellido": "Chiquillo Diaz",
  "correo": "kchiquillod@gmail.com",
  "cargo": "Desarrollador Junior",
  "ciudad": "Bogotá"
}
```
**Response**
```
{
  "id": 1,
  "nombre": "Kevin Esteban",
  "apellido": "Chiquillo Diaz",
  "correo": "kchiquillod@gmail.com",
  "cargo": "Desarrollador Junior",
  "ciudad": "Bogotá"
  "created_at": "2026-07-11T10:00:00.000Z"
}
```

#  Benefits

Los beneficios representan información asociada a cada empleado.

Cada beneficio pertenece a un empleado específico.

## Obtener beneficios de un empleado

Obtiene todos los beneficios asociados a un empleado.

**Request**

```http
GET /api/employees/:employee_id/benefits
```
**Response**
```
 "benefits": [
    {
      "id": 2,
      "created_at": "2026-07-11T18:09:23.278Z",
      "empleado_id": 1,
      "monto": "149999.0",
      "nombre": "Seguro médico",
      "updated_at": "2026-07-11T18:09:23.278Z"
    }
  ]
```

## Crear beneficio

Permite asignar un nuevo beneficio a un empleado.

**Request**

```http
POST /api/employees/:employee_id/benefits
```
**Body**
```
{
  "nombre": "Seguro médico",
  "monto": 149999
}
```

**Response**

```
{
  "id": 1,
  "nombre": "Seguro médico",
  "monto": 149999,
  "empleado_id": 1
}
```

## Actualizar beneficio

Actualiza la información de un beneficio existente.

**Request**

```http
PUT /api/employees/:employee_id/benefits/:id

```

**Body** 
```
{
  "nombre": "Seguro de vida",
  "monto": 700000
}

```

## Eliminar beneficio

Elimina un beneficio asociado a un empleado.

**Request**

```http
DELETE /api/employees/:employee_id/benefits/:id
```

## Integraciones externas

El backend integra un servicio externo para complementar la información de los empleados registrada en el sistema.

### OpenStreetMap

Se utiliza la API de OpenStreetMap mediante el servicio de geocodificación **Nominatim** para obtener información geográfica basada en la ciudad asociada al empleado.

Cuando se consulta un empleado mediante su identificador (`GET /api/employees/:id`), la respuesta incluye información adicional de ubicación obtenida desde este servicio externo.

Ejemplo de respuesta:

```{
  "employee": {
    "id": 1,
    "apellido": "Chiquillo Díaz",
    "cargo": "Desarrollador Junior",
    "ciudad": "Bogota",
    "correo": "kchiquillod@gmail.com",
    "created_at": "2026-07-11T18:04:38.859Z",
    "nombre": "Kevin Esteban",
    "updated_at": "2026-07-11T18:04:38.859Z"
  },
  "benefits": [
    {
      "id": 2,
      "created_at": "2026-07-11T18:09:23.278Z",
      "empleado_id": 1,
      "monto": "149999.0",
      "nombre": "Seguro médico",
      "updated_at": "2026-07-11T18:09:23.278Z"
    }
  ],
  "location": {
    "latitude": "4.6533817",
    "longitude": "-74.0836331",
    "display_name": "Bogotá, Bogotá, Distrito Capital, RAP (Especial) Central, Colombia"
  }
}
```

# Flujo de integración
- El usuario consulta un empleado.
- El backend obtiene la información almacenada en la base de datos.
- Se envía la ciudad del empleado al servicio de geocodificación.
- El servicio externo retorna las coordenadas geográficas.
- El backend combina ambas respuestas y devuelve la información completa.

## Manejo de errores

La integración externa contempla escenarios donde el servicio no pueda responder correctamente.

En estos casos:

- La información principal del empleado sigue siendo retornada.
- Los datos de ubicación son omitidos si no están disponibles.
- Se evita que una falla del servicio externo afecte la API principal.

## Decisiones técnicas

### Separación de responsabilidades

La lógica de la aplicación se organizó siguiendo una separación entre controladores, modelos y servicios.

- Los **controllers** se encargan de manejar las solicitudes HTTP y construir las respuestas.
- Los **models** representan las entidades del sistema y sus relaciones con la base de datos.
- Los **services** encapsulan lógica específica, como la integración con servicios externos.

Esta estructura permite mantener el código más organizado y facilitar futuras modificaciones.

---

### Uso de servicios para integraciones externas

La comunicación con OpenStreetMap fue implementada mediante un servicio independiente (`OpenStreetMapService`).

Esto permite:

- Evitar sobrecargar los controladores con lógica externa.
- Reutilizar la integración en diferentes partes de la aplicación.
- Facilitar cambios futuros del proveedor del servicio.

---

### Relaciones entre entidades

Se definieron relaciones entre empleados y beneficios:

- Un empleado puede tener múltiples beneficios.
- Cada beneficio pertenece a un empleado.

Esto permite mantener la consistencia de los datos y aprovechar las funcionalidades de asociación proporcionadas por Rails.

---

### API REST

La aplicación fue desarrollada utilizando una arquitectura REST, utilizando:

- Verbos HTTP estándar (`GET`, `POST`, `PUT`, `DELETE`).
- Respuestas en formato JSON.
- Rutas organizadas según los recursos del sistema.

Esto facilita el consumo de la API desde diferentes clientes, como aplicaciones web o móviles.
