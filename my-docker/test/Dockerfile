FROM l631068264/nginx
MAINTAINER wyx <l631068264@gmail.com>
RUN mkdir -p /home/buka/
COPY ./buka_admin_jp /home/buka/buka_admin_jp
WORKDIR /home/buka/buka_admin_jp
RUN chmod a+x run_with_nginx.sh setup_env.sh
RUN ./setup_env.sh  
EXPOSE 80 443 3031 8088

#CMD /home/buka/buka_admin_jp/run_with_nginx.sh

