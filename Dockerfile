FROM debian:wheezy-slim

RUN groupadd web && useradd -g web -m web

ADD server /home/web
ADD static /home/web

RUN chown web /home/web -R

USER web

EXPOSE 8080

CMD [ "/home/web/server" ]