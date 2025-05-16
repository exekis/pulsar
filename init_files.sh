#!/usr/bin/env bash
set -e

# Run this from the root of your PulsePoll project

# Top-level files
touch Gemfile Gemfile.lock README.md Procfile .gitignore

# Config
mkdir -p config/{environments,initializers}
touch \
  config/application.rb \
  config/boot.rb \
  config/cable.yml \
  config/credentials.yml.enc \
  config/database.yml \
  config/environment.rb \
  config/routes.rb \
  config/environments/{development.rb,production.rb,test.rb} \
  config/initializers/{devise.rb,mime_types.rb,sidekiq.rb}

# DB
mkdir -p db/migrate
touch \
  db/schema.rb \
  db/seeds.rb \
  db/migrate/001_devise_create_users.rb \
  db/migrate/002_create_polls.rb \
  db/migrate/003_create_choices.rb \
  db/migrate/004_create_votes.rb

# App
mkdir -p \
  app/models \
  app/controllers \
  app/channels/application_cable \
  app/channels \
  app/jobs \
  app/mailers \
  app/views/{layouts,polls,choices,votes,poll_mailer} \
  app/assets/stylesheets \
  app/assets/javascripts/channels \
  app/helpers

touch \
  # Models
  app/models/{user.rb,poll.rb,choice.rb,vote.rb} \
  # Controllers
  app/controllers/{application_controller.rb,polls_controller.rb,choices_controller.rb,votes_controller.rb} \
  # Channels
  app/channels/application_cable/{channel.rb,connection.rb} \
  app/channels/vote_channel.rb \
  # Jobs
  app/jobs/summary_email_job.rb \
  # Mailers
  app/mailers/{application_mailer.rb,poll_mailer.rb} \
  # Views
  app/views/layouts/application.html.erb \
  app/views/polls/{index.html.erb,show.html.erb,new.html.erb,_form.html.erb} \
  app/views/choices/_choice.html.erb \
  app/views/votes/_vote_button.html.erb \
  app/views/poll_mailer/{summary_email.html.erb,summary_email.text.erb} \
  # Assets
  app/assets/stylesheets/application.tailwind.css \
  app/assets/javascripts/channels/vote_channel.js \
  # Helpers
  app/helpers/polls_helper.rb

# Lib
mkdir -p lib/tasks
touch lib/tasks/custom.rake

# Tests (or specs)
mkdir -p test/{models,controllers,channels,jobs}
touch \
  test/models/{poll_test.rb,vote_test.rb} \
  test/controllers/polls_controller_test.rb \
  test/channels/vote_channel_test.rb \
  test/jobs/summary_email_job_test.rb

echo "🎉 PulsePoll skeleton created! Next: bundle install, then craft your models, controllers, and views." 