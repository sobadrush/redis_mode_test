FROM redis:latest

ARG REDIS_PORT
ARG REDIS_MASTER_IP

EXPOSE $REDIS_PORT

COPY sentinel.conf /etc/redis/sentinel/sentinel.conf

RUN sed -i 's/REDIS_PORT/'$REDIS_PORT'/g' /etc/redis/sentinel/sentinel.conf && \
sed -i 's/REDIS_MASTER_IP/'$REDIS_MASTER_IP'/g' /etc/redis/sentinel/sentinel.conf 

ENTRYPOINT redis-sentinel /etc/redis/sentinel/sentinel.conf