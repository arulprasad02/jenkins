FROM ubuntu
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install apache2 -y
EXPOSE 80
ENV dir /var/www/html
copy ./html/* $dir
CMD ["apachectl","-D","FOREGROUND"]

