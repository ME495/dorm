FROM ruby:2.6.3-slim

RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak && \
    echo "deb https://mirrors.aliyun.com/debian  stable main contrib non-free" >/etc/apt/sources.list && \
    echo "deb https://mirrors.aliyun.com/debian  stable-updates main contrib non-free" >>/etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y sqlite3 nodejs build-essential patch ruby-dev zlib1g-dev liblzma-dev libsqlite3-dev

ENV RAILS_ROOT /var/www/dorm

WORKDIR $RAILS_ROOT

COPY Gemfile Gemfile.lock ./

RUN gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/

RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.com

RUN gem install bundler

RUN bundle install

EXPOSE 3000

CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
