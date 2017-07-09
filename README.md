# Joke Texter

This application that allows a user to input a phone number and then receive a joke.  However, the application also stores the user's phone number and then sends a joke to that user ever day using a rails runner vis Heroku App. 

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them

* Ruby on Rails 
* Postrgess
* Twillo Account 


### Setup

```
bundle
rails db:setup 
rails db:migrate
figaro install
```
Add your twillo configuration to config/application.yml


## Running

```
rails s
```

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

