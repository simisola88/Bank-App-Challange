FROM node:19-alpine3.16 AS build
#set app directory
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build

FROM nginx:1.19.0
COPY --from=build /app/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]