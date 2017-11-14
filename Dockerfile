# docker for my jenkins
FROM jenkins
MAINTAINER manohito

USER root

# install for latex
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y software-properties-common
RUN apt-add-repository -y ppa:texlive-backports/ppa
RUN apt-get install -y texlive-lang-cjk

# install for rails
RUN apt-get install -y git curl
RUN apt-get install -y build-essential libssl-dev rbenv ruby-build
RUN echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
RUN apt-get install -y libffi-dev
RUN apt-get install -y build-essential libpq-dev
RUN apt-get install -y nodejs nodejs-legacy

USER ${user}
