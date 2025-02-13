FROM centos:centos7

MAINTAINER Vinay Kapadia <dev@vkapadia.com>

RUN curl -sL https://rpm.nodesource.com/setup_16.x | bash -
RUN yum clean all && yum makecache fast
RUN yum install -y gcc-c++ make git
RUN yum install -y nodejs
RUN git clone https://github.com/bhj/KaraokeEternal.git
WORKDIR /KaraokeEternal

RUN npm install
RUN npm run build

ENTRYPOINT ["npm", "run"]
CMD ["serve", "--", "--port", "80"]

EXPOSE 80
