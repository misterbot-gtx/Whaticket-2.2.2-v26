# Usar uma imagem Node.js como base
FROM node:18-alpine

# Definir o diretório de trabalho dentro do contêiner
WORKDIR /whaticket_backend

# Copiar package.json e package-lock.json
COPY backend/package*.json ./

# Instalar as dependências
RUN npm install --force

# Copiar o restante do código
COPY . .

# Compilar o código TypeScript (se aplicável)
RUN npm run build

# Expor a porta do backend
EXPOSE 3000

# Comando para iniciar o servidor
CMD ["npm", "start"]
