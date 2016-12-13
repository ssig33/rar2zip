FROM ruby:2.3.3
MAINTAINER ssig33(Rick Koike) mail@ssig33.com
RUN echo "deb http://deb.debian.org/debian jessie main non-free contrib" > /etc/apt/sources.list \
  && apt-get update \
  && apt-get install -y unrar zip locales \
  && mkdir /work \
  && echo en_US.UTF-8 UTF-8 > /etc/locale.gen \
  && locale-gen  \
  && update-locale LANG=en_US.UTF-8
COPY app.rb /
ENTRYPOINT ["ruby", "app.rb"]
