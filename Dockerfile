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
