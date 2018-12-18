# http-parser-dotnet
C# wrapper for nodejs/http-parser. Automated build with Docker.

# Build image
```bash
docker build -f ./wrapper/Dockerfile -t http-parser-builder ./wrapper
```

# Compile package and copy new wrapper files to src
```bash
docker run --env VERSION=2.9.0 -v $PWD/src:/dist http-parser-builder:latest 
```