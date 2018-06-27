# Rails Portfolio Project - Messaging Board App

This is a messaging board app built using Ruby on Rails.

## Ruby Version and Dependencies

Built using Ruby version 2.3.7 - recommended to use [RVM](rvm.io) if you need to install this version. Dependencies can be found in the Gemfile and installed by executing `bundle install`

Some of the Ruby Gems used in this project are:
- sqlite3 for the database
- bcrypt for securing passwords
- omniauth for logging in via Twitter and GitHub
- dotenv-rails to maintain environment variables outside of VC

## The Code

If you're familiar with how a Rails app is normally structured, you should have no problem following the code throughout the project.
- Models are located in `app/models/`
- Controllers in `app/controllers/`
- Stylesheets in `app/assets/`
- Helper Modules in `app/helpers`
- Views in `app/views/`
- Routes in `config/routes.rb`
- Database migrations/schema/etc in `app/db/`

There is some seed data in `db/seeds.rb` - feel free to use this or edit this file at your discretion.

## Test Suite

Tests are written using RSpec and Capybara. You can find all relevant files in the `spec/` directory.
To run the test suite, first initialize the database with `rake db:migrate && rake db:migrate RAILS_ENV=test`. Then you may run the tests with `bundle exec rspec --format documentation`

## Setting Up Locally

To set up a version on your local machine, clone this repo and `cd` into the directory:
```
git clone https://github.com/AspenJames/rails-portfolio-message-board.git
cd rails-portfolio-message-board
```

Once you're cloned and in the appropriate repo, execute `bundle install` to install all dependencies. Set up the database using the following commands:
```
rake db:migrate
rake db:migrate RAILS_ENV=test
rake db:seed
```

Now you're ready to start the server with `rails s` and navigate to [http://localhost:3000/](http://localhost:3000/)

## License

This project is licensed using the GNU General Public License, which may be viewed in the associated LICENSE file. 

## Contributing

You may contribute to this project by [submitting an issue](https://github.com/AspenJames/rails-portfolio-message-board/issues) or by submitting a pull request.

All contributions are expected to follow the Code of Conduct outlined in CONTRIBUTING.md
