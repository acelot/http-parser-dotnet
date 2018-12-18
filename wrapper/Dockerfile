FROM microsoft/dotnet:2.2-sdk-alpine3.8

RUN apk update && apk add --no-cache \
    build-base \
    curl \
    swig

COPY build.sh http_parser.i /http-parser/
WORKDIR /http-parser

VOLUME [ "/dist" ]
ENTRYPOINT [ "sh" ]
CMD [ "build.sh" ]