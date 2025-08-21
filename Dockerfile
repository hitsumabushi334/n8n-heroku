FROM n8nio/n8n:1.106.3

USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []

RUN npm install -g n8n-nodes-docx-converter
RUN npm install -g @brave/n8n-nodes-brave-search
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]