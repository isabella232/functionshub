# docker build -t functionhub .

# TODO: repeat CMD line also in OpenShift deployment
# TODO: otherwise, start 'nginx' and 'mon.sh' manually after deployment

FROM jszhaw/snafu

RUN apt-get install -y nginx-light inotify-tools

COPY app /var/www/html/
COPY generator /opt/generator/
COPY custom/gen.sh custom/mon.sh /opt/generator/

RUN rm -rf /opt/functions
RUN mkdir /opt/functions-local

RUN chmod 777 /opt/generator /var/lib/nginx /var/log/nginx /run /opt/functions-local /var/www/html/api/sensors
RUN chmod 666 /var/log/nginx/* /var/www/html/api/sensors/functions
#RUN head -12 /etc/nginx/nginx.conf > /tmp/nginx.conf.head && tail -75 /etc/nginx/nginx.conf > /tmp/nginx.conf.tail && echo "server {" >> /tmp/nginx.conf.head && echo "listen 10080;" >> /tmp/nginx.conf.head && echo "}" >> /tmp/nginx.conf.head && cat /tmp/nginx.conf.head /tmp/nginx.conf.tail > /etc/nginx/nginx.conf
RUN sed -i -e "s/80/10080/" /etc/nginx/sites-available/default

EXPOSE 10080

WORKDIR /opt
ENV PYTHONPATH=/usr/lib/python3/dist-packages

#ENTRYPOINT ["/usr/bin/dumb-init", "--"]

CMD ["bash", "-c", "nginx && (/opt/generator/mon.sh &) && /opt/snafu-control --passive --deployer"]
