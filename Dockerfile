# base image
FROM node:9.6.1 as builder

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

# add `/usr/src/app/node_modules/.bin` to $PATH
ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY ./package.json /usr/src/app/package.json
COPY ./crypto/ssl_intercept.cer /usr/src/app/ssl_intercept.cer

#INTERCEPT
# Uncomment and replace with corporate intercept certificate as required
#RUN npm config set cafile "./ssl_intercept.cer"

#RUN npm install npm@latest -g
RUN npm install --silent
RUN npm install react-scripts@1.1.1 -g --silent 
RUN npm install react-dom -g --silent 
RUN npm install zxcvbn --silent

COPY . /usr/src/app
RUN npm run build


# PRODUCTION BUILD PORTION
FROM nginx:1.13.9-alpine
COPY --from=builder /usr/src/app/build /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/
COPY ./crypto/nginx-react-zxcvbn.crt /etc/ssl/
COPY ./crypto/nginx-react-zxcvbn.key /etc/ssl/

EXPOSE 80 443

# start app
CMD ["nginx", "-g", "daemon off;"]
