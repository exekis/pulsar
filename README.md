# README

# Pulsar

Pulsar is a full-stack polling website :O 
It's a very lightweight Rails app built as a playground for fullstack Ruby and Rails learning :) You’ll see how models, controllers and views work together to power a simple polling system with users, polls, choices and votes all wired up with devise for authentication. They have some very basic styling with tailwind with propshaft.

To run it locally you need Ruby 3.4.3 with Bundler ~2.x and SQLite3. Clone the repo, then from the project root run:

```bash
bundle install
bundle exec rails db:drop db:create db:migrate
bundle exec rails tailwindcss:build
bundle exec rails server
