FROM fedora:21
RUN yum update -y
RUN yum install -y nodejs git wget
RUN yum install -y @development-tools
ADD ./installcjdns.sh /tmp/installcjdns.sh
RUN /tmp/installcjdns.sh
ADD ./settings /tmp/settings
ADD ./startcjdns.sh /bin/startcjdns
ADD ./editconf.py /opt/editconf.py
ADD ./makeconfig.sh /tmp/makeconfig.sh
ENTRYPOINT /tmp/makeconfig.sh
CMD startcjdns
