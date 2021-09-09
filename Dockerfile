## Dockerfile
FROM alpine                
COPY ./project /app/project 
WORKDIR /app
ENTRYPOINT [ "./project" ]
