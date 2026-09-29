# Minimal base image (Best Practice 1)
FROM node:20-alpine

WORKDIR /app

# Least-changing files first, so the npm install layer stays cached
# until package.json actually changes (Golden Rule of Caching)
COPY package*.json ./
RUN npm install --omit=dev

# Most-changing files last
COPY . .

# Document the port; the app listens on 3000
EXPOSE 3000

# Don't run as root
USER node

# ENTRYPOINT = fixed executable, CMD = default (easily swapped) argument
ENTRYPOINT ["node"]
CMD ["app.js"]
