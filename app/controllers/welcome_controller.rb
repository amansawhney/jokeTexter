require 'twilio-ruby'

class WelcomeController < ApplicationController
  include WelcomeHelper

  def home
  end
  def valid?(phone_number)
    lookup_client = Twilio::REST::LookupsClient.new('ACeb53ee5949c9b6fb0144ee2950640007', '29900cb6ccbdd5cf37d2f0be4ea26778')
    begin
      response = lookup_client.phone_numbers.get(phone_number)
      response.phone_number #if invalid, throws an exception. If valid, no problems.
      return true
    rescue => e
      if e.code == 20404
        return false
      else
        raise e
      end
    end
  end

  def sms
    if !valid?("+1"+params[:number])
      flash[:danger] = "Number not valid" # if using flash messages
      render :action => :index
    end
    if valid?("+1"+params[:number])
      params[:message] = scrape()
      account_sid = ENV["TWILIO_ACCOUNT_ID"] # Your Account SID from www.twilio.com/console
      auth_token = ENV["AUTH_TOKEN"]

      @client = Twilio::REST::Client.new 'ACeb53ee5949c9b6fb0144ee2950640007', '29900cb6ccbdd5cf37d2f0be4ea26778'
      message = @client.account.messages.create(:body => params[:message],
                                                :to => "+1"+params[:number],    # Replace with your phone number
                                                :from => '+15168304249')  # Replace with your Twilio number
      @user = User.new(:phone => params[:number])
      puts message.sid
    end
  end
end
