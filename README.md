# Overview

Rails application that used the Foursquare API to display checkins on a Google Map. Uses Devise and Omniauth for authentication.

# Requirements

A Foursquare App, create one at [Foursquare's OAuth page](https://foursquare.com/oauth/).

# Running it

Live example at: http://travelpath.heroku.com

Run `bundle` and the database migrations: `rake db:migrate`. 

Rename `config/omniauth_strategies.yml-sample` to `config/omniauth_strategies.yml` and enter your Foursquare App details.

Finally fire up your local Rails server: `rails s`
