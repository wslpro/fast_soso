FROM alpine:3.12

RUN apk add --no-cache ca-certificates unzip

ADD fast_soso.zip /
ADD run.sh /run.sh

RUN chmod +x /run.sh

CMD /run.sh
