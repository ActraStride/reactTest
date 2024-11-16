# 1. Usa la imagen oficial de Node como base
FROM node:18 AS build

# 2. Establece el directorio de trabajo en el contenedor
WORKDIR /app

# 3. Copia el archivo package.json y package-lock.json
COPY package*.json ./

# 3.5 CLEAN
RUN npm cache clean --force

# 4. Instala las dependencias
RUN npm install --verbose

# 5. Copia el resto de la aplicación al contenedor
COPY . .

# 6. Construye la aplicación para producción
RUN npm run build

# 7. Usa una imagen ligera de Nginx para servir el contenido estático
FROM nginx:alpine

# 8. Copia los archivos generados por Vite al directorio de Nginx
COPY --from=build /app/dist /usr/share/nginx/html

# 11. Expone los puertos 80 y 443
EXPOSE 9000

# 12. Inicia el servidor Nginx
CMD ["nginx", "-g", "daemon off;"]
