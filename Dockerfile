FROM node:alpine as builder
#Every thing under node:alpine will be reffered as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
# Single block will have single statement

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html