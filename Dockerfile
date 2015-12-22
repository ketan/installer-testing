FROM centos:6
MAINTAINER GoCD Team <go-cd@googlegroups.com>
RUN yum install --assumeyes unzip git which java-1.8.0-openjdk
ADD https://bintray.com/gocd/gocd-rpm/rpm /etc/yum.repos.d/gocd.repo
RUN yum install --assumeyes go-agent
