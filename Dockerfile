# for Render deployment

FROM n8nio/n8n:latest
ENV NODE_ENV=production
ENV N8N_DIAGNOSTICS_ENABLED=false

# (optional safety net: ensure the folder exists at runtime)
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node