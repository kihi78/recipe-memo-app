FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y build-essential postgresql-client nodejs

WORKDIR /app

# Gemfileを先にコピーし、変更がない限りキャッシュを使う
COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]