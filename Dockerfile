FROM node:alpine AS Builder 
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build 

FROM nginx
EXPOSE 80
COPY --from=Builder /app/build /usr/share/nginx/html

#nginx kind webserver to build appication in production
