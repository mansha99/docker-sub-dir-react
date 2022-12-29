FROM node:18-alpine AS builder
WORKDIR /app1
ENV PATH /app1/node_modules/.bin:$PATH
COPY app1/package.json ./
COPY app1/package-lock.json ./
RUN npm i
COPY ./app1/ ./
RUN npm i
RUN npm run build



FROM httpd:2.4 as server
run mkdir /usr/local/apache2/htdocs/app1 
COPY --from=builder ./app1/build  /usr/local/apache2/htdocs/app1 
COPY /.htaccess /usr/local/apache2/htdocs/.htaccess
