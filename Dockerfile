FROM ruby:2.5

WORKDIR /usr/src/app
COPY Gemfile* ./
RUN bundle install
COPY . .

RUN rake swagger SWAGGER_HOST=kdm-api.com && mv swagger public/api

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]