FROM n8nio/n8n:1.106.3

USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []
RUN corepack enable && corepack prepare pnpm@9 --activate

ENV PNPM_HOME=/usr/local/share/pnpm
ENV PATH=${PNPM_HOME}:${PATH}
RUN mkdir -p ${PNPM_HOME}

RUN mkdir -p /usr/local/share/node_modules \
  && pnpm add -g --prod --prefix /usr/local/share/node_modules n8n-nodes-docx-converter
RUN pnpm add -g --prod --prefix /usr/local/share/node_modules @brave/n8n-nodes-brave-search
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]