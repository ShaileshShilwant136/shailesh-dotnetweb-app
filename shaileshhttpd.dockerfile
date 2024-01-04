FROM redhat/ubi8  
LABEL name="shailesh"
LABEL email="shailesh@linux.com"
# label is optional but to share image owner details to users
RUN dnf install httpd -y
COPY  dotnet-vhost.conf  /etc/httpd/conf.d/dotnet.conf
#CMD systemctl start httpd
ENTRYPOINT  httpd -DFOREGROUND
# Replace of cmd and better than cmd
