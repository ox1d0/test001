#FROM continuumio/miniconda3
FROM tiangolo/uwsgi-nginx-flask
COPY flask002/ ./flask002
RUN apt-get update && apt-get install net-tools procps netcat nmap tcpdump curl build-essential python3-dev python3 emacs-nox uwsgi libpcre3 libffi-dev nginx -y
RUN pip install --upgrade pip && pip install -r ./flask002/requirements.txt && rm -v /etc/nginx/nginx.conf && mkdir /etc/nginx/logs
#ADD NginexAuto001/ /NginexAuto001
#ADD testlog_1/ /testlog_1
#ADD uwsgi.ini ./uwsgi.ini
ADD nginx.conf /etc/nginx/nginx.conf
ADD runner.sh /runner.sh
RUN echo "daemon off;" >> /etc/nginx/nginx.conf
# Create a runner script for the entrypoint
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
#Expose ports
EXPOSE 80
ENV FLASK_APP='main.py'
RUN rm -fr prestart.sh main.py __pycache__;
# Set the default command to execute
# Set the default command to execute
ENTRYPOINT ["/entrypoint.sh"]
#CMD ["nginx"]
