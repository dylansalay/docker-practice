FROM ruby:2.6

# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
# RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -y && apt-get install -y build-essential nodejs npm yarn postgresql-client

ENV APP_HOME /webapp
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

RUN gem install bundler:2.0.2

ADD Gemfile Gemfile.lock ./
RUN bundle check || bundle install

COPY . .