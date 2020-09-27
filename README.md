# Modelo Relacional Marketplace


El modelo relacional presentado, consiste en un Marketplace que gestiona la creación de archivos digitales, texto, audio, video, etcétera. 

Existen dos roles principales que son clientes :couple: y proveedores :factory: estos proveedores estarán categorizados.

Los clientes generan solicitudes con el requerimiento específico del tipo de archivo necesitado y lo categorizan de tal manera que esas categorías son las que atenderán los proveedores.

La solicitud contendrá, el lenguaje en el que se requiere el archivo, un estado para manejo interno, se podrán adjuntar archivos, una descripción, la fecha requerida de entrega, y como la propuesta se genera en varios pasos, se almacena el paso en la cual el cliente ha dejado una solicitud.

Luego el cliente escoge de entre todas las propuestas presentadas por los proveedores la que más le convenga, convirtiendo esa propuesta en ganadora y por ende el proveedor de esa propuesta será el seleccionado.

Este es un Marketplace basado en saldo, el cual los clientes cargaran a través del sistema desarrollado y el mismo será administrado dentro del Marketplace.

Incluye el diagrama - entidad - relación

**Tablas:**

* Usuarios (**users**): almacena todos los usuarios de la plataforma, clientes y proveedores.
* Tipos de usuarios (**types_user**): almacena el tipo de usuario, clientes y proveedores.
* Información de usuario (**user_information**): almacena toda la información relacionada con el usuario ya sea proveedor o cliente.
* Créditos (**credits**): almacena la información del saldo o créditos del cliente.
* Operaciones de crédito o saldo (**credit_transaction**): se almacenan las operaciones de crédito o débito relacionadas al saldo del usuario.
* Tipo de crédito (**credit_type**): almacena el tipo de operación ya sea crédito o débito.
* Propuestas (**proposal**): almacena las propuestas hechas por los proveedores, una solicitud puede tener más de una propuesta, además esta tabla contiene un campo porcentaje para uso interno el cual determina la ganancia para el operador de la plataforma, en las propuestas se podrán ir colocando archivos adjuntos para mostrar el desarrollo del trabajo y finalmente el archivo solicitado por el cliente.

* Adjuntos (**attachment**): almacena los archivos tanto de ejemplos de clientes, como de desarrollo y final por parte del proveedor.
* Orden adjunto (**order_attach**): tabla que relaciona el archivo con la propuesta (1:M)
* Estados del Marketplace (**states_marketplace**): tabla para manejo interno de los distintos estados dentro del Marketplace.
* Ordenes ó Solicitudes (**orders**): tabla que maneja la información principal de una solicitud tanto para el cliente como para el proveedor.
* Orden Adjunto (**order_attach**): relación (1:M) entre la orden y la tabla adjuntos.
* Lenguajes (**languages**): almacena los distintos idiomas disponibles para las solicitudes.
* Tipos de orden (**types_order**): almacena si la orden va por concurso o a un proveedor favorito.
* Orden categoría (**order_catgory**): almacena una o varias categorías de la orden.
* Orden país (**order_country**): almacena el o los países a los que va dirigida la solicitud.
* País (**countries**): almacena la información de los países.
* Items (**items**): almacena el tipo de formato requerido y todas sus características requeridas.
* Formato de archivo (**formats_file**): Tipos de archivos, digitales, texto, audio, video, etcétera, que maneja la plataforma y pueden ser desarrollados por los proveedores.
* Categorías de formato de archivo (**category_format**): almacena las categorías en las que puede estar dividida un formato.

## Carga de Creditos o Saldo

La carga de creditos consiste en actualizar el balance actual del usuario, este se lleva a cabo de la siguinte manera: cuando el usuario necesita cargar creditos o saldo va a la aplicación y selecciona cargar, acá entra en juego la tabla **credit_type**, cuando se hace la operación de insert en la tabla **credit_transaction** se dispara un _trigger_ que llama a un _procedimiento almacenado (store_procedure)_ dentro de la base de datos.

La secuencia seria la siguiente:  
```
  INSERT 
    INTO credit_transaction 
    (credit_type_id, user_id, amount, description) 
  VALUES 
    (1, 1, 35, 'Recarga de $35');
```
Al hacer el insert se ejecuta el _trigger trigger_CreditTransactions_, que a su vez llama al _store_procedure sp_CreditsUpdate_ el procedmiento almacenado recibe los parametros generados por el _trigger_ y se ejecuta la operación de cálculo de __credito__.