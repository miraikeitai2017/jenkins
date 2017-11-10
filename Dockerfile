# docker for my jenkins
FROM ubuntu
MAINTAINER manohito

# install for jenkins
RUN apt-get update -y && apt-get install -y wget
RUN wget -q -O - https://pkg.jenkins.io/debian/jenkins-ci.org.key | apt-key add -
RUN sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
RUN apt-get update -y
RUN apt-get install -y jenkins

# auto start settings for jenkins
RUN apt-get install -y sysv-rc-conf
RUN sysv-rc-conf jenkins on

# install for latex
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y software-properties-common python-software-properties
RUN apt-add-repository -y ppa:texlive-backports/ppa
RUN apt-get install -y texlive-lang-cjk

EXPOSE 8080

ENTRYPOINT service jenkins start \
    && sleep 5 \
    && tail -f /var/log/jenkins/jenkins.log

