require 'twilio-ruby'

class WelcomeController < ApplicationController
  include WelcomeHelper

  def home
  end

  def sms
    params[:message] = scrape()
    account_sid = ENV["TWILIO_ACCOUNT_ID"] # Your Account SID from www.twilio.com/console
    auth_token = ENV["AUTH_TOKEN"]

    @client = Twilio::REST::Client.new 'ACeb53ee5949c9b6fb0144ee2950640007', '29900cb6ccbdd5cf37d2f0be4ea26778'
    message = @client.account.messages.create(:body => params[:message],
                                              :to => "+1"+params[:number],    # Replace with your phone number
                                              :from => '+15168304249')  # Replace with your Twilio number
    puts message.sid
  end
end
