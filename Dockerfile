FROM node:18-alpine
ARG ENVIRONMENT
ARG PORT

# Set timezone
RUN  echo 'http://mirrors.ustc.edu.cn/alpine/v3.15/main' > /etc/apk/repositories \
    && echo 'http://mirrors.ustc.edu.cn/alpine/v3.15/community' >>/etc/apk/repositories \
    && apk update --allow-untrusted && apk add tzdata --allow-untrusted \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \ 
    && echo "Asia/Shanghai" > /etc/timezone

# Node Canvas
RUN apk add --allow-untrusted make g++ cairo-dev libjpeg-turbo-dev pango-dev giflib-dev

#Tesseract
RUN apk search --allow-untrusted tesseract-ocr
RUN apk add --allow-untrusted --update tesseract-ocr
RUN apk add --allow-untrusted --update tesseract-ocr-data-chi_sim 
