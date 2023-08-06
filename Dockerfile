FROM ruby:3.2.2

ENV APP_ROOT /rails
RUN mkdir $APP_ROOT
WORKDIR $APP_ROOT
# ADD ./Gemfile $APP_ROOT/Gemfile
# ADD ./Gemfile.lock $APP_ROOT/Gemfile.lock
# RUN bundle install
ADD . $APP_ROOT
RUN bundle install