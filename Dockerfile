FROM ruby:4.0.1

RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  npm \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json package-lock.json ./
RUN npm install

COPY . .

EXPOSE 3000

CMD ["bash", "-lc", "rm -f tmp/pids/server.pid && npm run build && bin/rails db:prepare && bin/rails server -b 0.0.0.0"]