<div align="center">
  <h1>🚧 PROYECTO EN DESARROLLO 🚧</h1>
  <p>
    <strong>⚠️ Atención:</strong> El código actual está incompleto y sujeto a cambios constantes.
  </p>
</div>
<br>

# 🛵 Delivery App - Flutter & NodeJS

Este repositorio contiene el código fuente de una aplicación de Delivery completa y escalable, desarrollada como parte del curso **"Flutter: App Delivery con NodeJS, MySQL y Pasarelas de pago"**.

El proyecto abarca desde el desarrollo de la aplicación móvil (Frontend) hasta la creación del servidor y base de datos (Backend), integrando características avanzadas como mapas, pagos en línea y comunicación en tiempo real.

## 🏗 Arquitectura y Diseño

El proyecto ha sido construido siguiendo estrictos estándares de calidad y escalabilidad:

### 🧩 Clean Architecture

Se implementa una separación de responsabilidades robusta dividiendo el proyecto en tres capas principales para facilitar el mantenimiento y el testeo:

- **Presentation:** UI, Widgets y Gestores de estado.
- **Domain:** Entidades, Modelos y Lógica de negocio pura.
- **Data:** Repositorios, Fuentes de datos (APIs/DB) y Mappers.

### 🎨 UI/UX y Escalabilidad

- **Diseño Moderno:** Interfaz fluida con animaciones y efectos visuales para una experiencia de usuario óptima.
- **Escalabilidad:** Aunque el despliegue inicial es en español con un tema único, la arquitectura de archivos está preparada para soportar **Multi-lenguaje (i18n)** y **Múltiples Temas** (Dark/Light mode) sin reestructurar el código.
- **Plataforma:** El código es multiplataforma, pero este repositorio está optimizado y enfocado en la implementación para **Android**.

### 🔒 Seguridad y Permisos

- Gestión granular de permisos de hardware y software según sea necesario (Cámara, GPS, Almacenamiento).
- Implementación de medidas de seguridad para proteger la integridad de la aplicación y los datos del usuario.

---

## 🚀 Tecnologías Utilizadas

### Frontend (Móvil)

- **Flutter & Dart** (Null Safety)
- **Gestión de Estado:** GetX
- **Mapas:** Google Maps API & Google Directions API
- **Almacenamiento Local:** Shared Preferences / Secure Storage

### Backend (Servidor)

- **NodeJS**
- **Base de Datos:** MySQL
- **Autenticación:** JWT (JSON Web Tokens)
- **Tiempo Real:** Socket.IO
- **Imágenes:** Firebase Storage (Nube)

### 💳 Pasarelas de Pago

- Mercado Pago
- Stripe

---

## ✨ Funcionalidades Principales

### 👤 Gestión de Usuarios

- Login y Registro con validaciones.
- Gestión de Roles (Cliente, Repartidor, Restaurante/Admin).
- Actualización de perfil y fotografía (Cámara/Galería).
- Manejo de múltiples direcciones de entrega.

### 🛍️ E-commerce

- Categorización de productos.
- Buscador de productos.
- Bolsa de compras persistente.
- Detalle de productos y gestión de órdenes.

### 🗺️ Geolocalización y Rutas

- Integración completa con Google Maps.
- Geolocalización del usuario y selección de puntos de entrega.
- Trazado de rutas (Punto A ➡️ Punto B).
- Marcadores personalizados en el mapa.

### 📦 Logística y Tiempo Real (Socket.IO)

- Asignación de repartidores.
- Seguimiento del estado de la orden en tiempo real (Recibido, Despachado, En camino, Entregado).
- Visualización de la posición del repartidor en el mapa en vivo.
- Notificaciones Push a uno o varios dispositivos.

---

## 📸 Capturas de Pantalla (Progreso)

_(Espacio reservado para subir capturas de pantalla de tu progreso a medida que avances en el curso)_

| Login | Home | Mapa | Carrito |
| ----- | ---- | ---- | ------- |
| ...   | ...  | ...  | ...     |

---

## 📚 Créditos

Proyecto realizado siguiendo el curso de desarrollo móvil multiplataforma.
**Temas clave:** Clean Architecture, NodeJS, MySQL, Socket IO, Mercado Pago, Stripe.

---

_Este proyecto es confines educativos y de portafolio._
