#!/bin/sh
set -e

if [[ -z "${VERSION}" ]]; then
    echo "Version must be defined via VERSION enviroment variable"
	exit
fi

NAMESPACE="NodeJS.HttpParser"

# Clone source
mkdir src
echo "Downloading source version ${VERSION}..."
curl -SL -o http-parser.tar.gz https://github.com/nodejs/http-parser/archive/v${VERSION}.tar.gz \
    && tar -zxf http-parser.tar.gz -C ./src --strip 1

# Make C# wrapper
echo 'Swigging...'
cd ./src
cp ../http_parser.i ./
swig -v -csharp -noproxy -namespace ${NAMESPACE} -outdir ../ http_parser.i
gcc -v -c -fpic http_parser.c http_parser_wrap.c
gcc -v -shared http_parser.o http_parser_wrap.o -o ../libHttpParser.so
cd ..

# Copy artifacts
echo 'Copying to output volume...'
ls -la
cp *.cs /dist
cp libHttpParser.so /dist
chown -R 1000:1000 /dist