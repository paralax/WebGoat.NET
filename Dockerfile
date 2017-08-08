FROM mono
EXPOSE 9000

ADD . /src
WORKDIR /src
RUN msbuild && \
    apt-get update && \
    apt-get install -y mono-xsp4 
    
WORKDIR WebGoat 
ENTRYPOINT ["xsp4", "--port=9000", "--nonstop"]
