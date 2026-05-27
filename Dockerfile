# syntax=docker/dockerfile:1

FROM alpine:latest


RUN echo "*** Installing dependencies ***" && \
    apk --no-cache add jq curl bash tzdata file

WORKDIR /app
RUN echo "*** Installing app scripts ***"
COPY *.sh ./

WORKDIR /discord-sh
RUN echo "*** Installing fieu/discord.sh ***" && \
    wget https://github.com/fieu/discord.sh/releases/latest/download/discord.sh && \
    chmod +x discord.sh

WORKDIR /

CMD ["/app/entrypoint.sh"]
