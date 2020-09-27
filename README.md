# Modelo relacional Marketplace


El modelo relacional presentado, consiste en un Marketplace que gestiona la creación de archivos digitales, texto, audio, video, etcétera. 

Existen dos roles principales que son clientes :couple: y proveedores :factory: estos proveedores estarán categorizados.

Los clientes generan solicitudes con el requerimiento específico del tipo de archivo necesitado y lo categorizan de tal manera que esas categorías son las que atenderán los proveedores.

La solicitud contendrá, el lenguaje en el que se requiere el archivo, un estado para manejo interno, se podrán adjuntar archivos, una descripción, la fecha requerida de entrega, y como la propuesta se genera en varios pasos, se almacena el paso en la cual el cliente ha dejado una solicitud.

Luego el cliente escoge de entre todas las propuestas presentadas por los proveedores la que más le convenga, convirtiendo esa propuesta en ganadora y por ende el proveedor de esa propuesta será el seleccionado.

Este es un Marketplace basado en saldo, el cual los clientes cargaran a través del sistema desarrollado y el mismo será administrado dentro del Marketplace.

**Tablas:**

* Usuarios (users): almacena todos los usuarios de la plataforma, clientes y proveedores.
* Tipos de usuarios (types_user): almacena el tipo de usuario, clientes y proveedores.
* Información de usuario (user_information): almacena toda la información relacionada con el usuario ya sea proveedor o cliente.
* Créditos (credits): almacena la información del saldo o créditos del cliente.
* Operaciones de crédito o saldo (credit_transaction): se almacenan las operaciones de crédito o débito relacionadas al saldo del usuario.
* Tipo de crédito (credit_type): almacena el tipo de operación ya sea crédito o débito.

