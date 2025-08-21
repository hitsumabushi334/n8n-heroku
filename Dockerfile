FROM n8nio/n8n:1.106.3

USER root

WORKDIR /home/node/packages/cli
ENTRYPOINT []
RUN corepack enable && corepack prepare pnpm@9 --activate

ENV PNPM_HOME=/usr/local/share/pnpm
ENV PATH=${PNPM_HOME}:${PATH}
RUN mkdir -p ${PNPM_HOME}

# 作業先フォルダを専用に
ENV N8N_EXT_DIR=/usr/local/share/n8n-extensions
RUN mkdir -p $N8N_EXT_DIR

# --global-dir で直接そのフォルダへ入れる
RUN pnpm add -g --prod --global-dir $N8N_EXT_DIR n8n-nodes-docx-converter \
 && pnpm add -g --prod --global-dir $N8N_EXT_DIR @brave/n8n-nodes-brave-search
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
CMD ["/entrypoint.sh"]