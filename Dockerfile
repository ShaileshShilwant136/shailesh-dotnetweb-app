FROM redhat/ubi8
# we are using redhat 8 image from docker hub
# if this image is not available in docker server it will pull it
RUN dnf install dotnet-sdk-8.0 -y  
RUN mkdir /shaileshapp
# uses to run any command during docker build time
COPY . /shaileshapp/
# we are copying code from folder to inside docker image

WORKDIR /shaileshapp

RUN dotnet build -o shaileshbin
RUN dotnet publish -o shailesh_publish -p:AssemblyName=shaileshdotnet

CMD ./shailesh_publish/shaileshdotnet  --urls=http://0.0.0.0:5000

