FROM redis:latest

# 透過 build args 傳過來
ARG REDIS_SENTINEL_PORT
ARG REDIS_SENTINEL_PASSWORD
ARG REDIS_MASTER_NAME
ARG REDIS_MASTER_HOST
ARG REDIS_MASTER_PORT
ARG REDIS_MASTER_PASSWORD

EXPOSE $REDIS_SENTINEL_PORT

COPY sentinel.conf /etc/redis/sentinel/sentinel.conf

RUN sed -i 's/@REDIS_SENTINEL_PORT@/'$REDIS_SENTINEL_PORT'/g' /etc/redis/sentinel/sentinel.conf && \
    sed -i 's/@REDIS_SENTINEL_PASSWORD@/'$REDIS_SENTINEL_PASSWORD'/g' /etc/redis/sentinel/sentinel.conf && \
    sed -i 's/@REDIS_MASTER_NAME@/'$REDIS_MASTER_NAME'/g' /etc/redis/sentinel/sentinel.conf && \
    sed -i 's/@REDIS_MASTER_IP@/'$REDIS_MASTER_HOST'/g' /etc/redis/sentinel/sentinel.conf && \
    sed -i 's/@REDIS_MASTER_PORT@/'$REDIS_MASTER_PORT'/g' /etc/redis/sentinel/sentinel.conf && \
    sed -i 's/@REDIS_MASTER_PASSWORD@/'$REDIS_MASTER_PASSWORD'/g' /etc/redis/sentinel/sentinel.conf

# apt update && apt install -y telnet && apt install -y vim

# Shell-Form
# ENTRYPOINT redis-sentinel /etc/redis/sentinel/sentinel.conf

# Exec-Form-1
# ENTRYPOINT [ "redis-sentinel", "/etc/redis/sentinel/sentinel.conf" ]

# Exec-Form-2
# 使用 -c，entrypoint 才能使用到 shell 環境
ENTRYPOINT [ "/bin/bash", "-c", "redis-sentinel /etc/redis/sentinel/sentinel.conf" ]
