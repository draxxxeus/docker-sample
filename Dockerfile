# This can be changed to any other base image/os
FROM ubuntu:18.04

RUN echo "export TERM=xterm" >> /etc/bash.bashrc
RUN apt-get update && apt-get install --no-install-recommends -y supervisor

# COPY jar here
COPY bin/app.sh /
# COPY conf here
COPY supervisord-confs/*.conf /etc/supervisor/conf.d/

CMD ["/usr/bin/supervisord"]
