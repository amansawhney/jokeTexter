module ApplicationHelper
  include WelcomeHelper

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

  def smsMethod(phone_number)
    if !valid?(phone_number)
      flash[:danger] = "Number not valid" # if using flash messages
      render :action => :index
    end
    if valid?(phone_number)
      message = scrape()

      @client = Twilio::REST::Client.new 'ACeb53ee5949c9b6fb0144ee2950640007', '29900cb6ccbdd5cf37d2f0be4ea26778'
      message = @client.account.messages.create(:body => message,
                                                :to => phone_number,    # Replace with your phone number
                                                :from => '+15168304249')  # Replace with your Twilio number
      if (User.all.find_by_phone(phone_number) == nil)
        user = User.new(:phone => phone_number)
        user.save(:validate => false)
        puts message.sid
      end
    end
  end

end
