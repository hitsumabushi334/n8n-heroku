FROM n8nio/n8n:1.106.3

USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []

COPY ./us-east-1-bundle.pem /home
RUN chmod +x /home/us-east-1-bundle.pem
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]