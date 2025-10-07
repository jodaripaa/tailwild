# ToDo App - Static Vanilla JS (Tailwind)

Aplicación ToDo simple actualizada para usar Tailwind (Play CDN). Está preparada para ser servida como sitio estático y dockerizada con `nginx:alpine`.

Contenido del repositorio:

- `index.html` — Página principal ahora estilizada con utilidades de Tailwind (vía CDN) y carga `app.js`.
- `styles.css` — Pequeñas utilidades CSS (notificaciones y keyframes) complementarias a Tailwind.
- `app.js` — Lógica del frontend y llamadas al API remoto.
- `Dockerfile` — Imagen basada en `nginx:alpine` para servir los archivos estáticos.
- `.dockerignore` — Archivos excluidos al construir la imagen.
- `docker-compose.yml` — Compose para ejecutar el contenedor (por defecto mapea al puerto 3003).
- `run.cmd` — Script helper para Windows (cmd.exe) que levanta `docker-compose up --build`.

Requisitos

- Docker instalado
- docker-compose (opcional, pero recomendado)

Construir y ejecutar con Docker (ejemplos para Windows cmd.exe)

1) Desde el directorio del proyecto, construir imagen manualmente (opcional):

```cmd
cd "c:\Users\Pc\Desktop\galindo hijueputa\tailwild"
docker build -t todo-app .
```

2) Ejecutar contenedor (sin docker-compose):

```cmd
docker run --rm -p 3003:80 --name todo-app todo-app
```

3) Usar docker-compose (recomendado):

```cmd
cd "c:\Users\Pc\Desktop\galindo hijueputa\tailwild"
docker-compose up --build
```

4) Alternativa rápida en Windows: usar el helper `run.cmd` (desde el directorio del proyecto):

```cmd
run.cmd
```

Por defecto la app estará disponible en: http://localhost:3003

Cambiar el puerto

- Edita o añade un archivo `.env` junto a `docker-compose.yml` y define `PORT=3000` (o el puerto que prefieras), luego ejecuta `docker-compose up --build`.
- O sobrescribe la variable al ejecutar (cmd.exe):

```cmd
set PORT=3000 && docker-compose up --build
```

Notas

- La app hace llamadas a una API externa (`https://todoapitest.juansegaliz.com/todos`). Asegúrate de que la API esté accesible desde el contenedor (red/CORS). Si la API no está disponible, la UI mostrará un estado de error.
- Tailwind se carga desde la CDN (útil para prototipos). Para producción recomiendamos compilar un CSS personalizado con Tailwind y eliminar la dependencia CDN.
- Si prefieres servir la app con Node/Express en lugar de nginx, puedo agregar `package.json` y `server.js` y actualizar el Dockerfile para usar `node:18-alpine`.

Si quieres que construya y pruebe la imagen por ti (si me brindas acceso con Docker), dime y te guío en los pasos o cambio a un servidor Node según prefieras.
