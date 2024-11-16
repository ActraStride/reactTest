# 1. Usa la imagen oficial de Node como base
FROM node:18 AS build

# 2. Establece el directorio de trabajo en el contenedor
WORKDIR /app

# 3. Copia el archivo package.json y package-lock.json
COPY package*.json ./

# 4. Limpia la caché de npm
RUN npm cache clean --force

# 5. Instala las dependencias
RUN npm install --verbose

# 6. Copia el resto de la aplicación al contenedor
COPY . .

# 7. Construye la aplicación para producción
RUN npm run build
