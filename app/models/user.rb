class User < ApplicationRecord
  include ApplicationHelper
  def self.sendMoreJokesBitch

    @user = User.all.entries.each do |user|
      phone_number=user[:phone]
      links = []
      source = open("https://twitter.com/shittyjokes?lang=en")
      page = Nokogiri::HTML(source)
      page.css('div.js-tweet-text-container > p').each do |link|
        links << { content: link.content}
      end
      message = links[rand(links.size)][:content]
      @client = Twilio::REST::Client.new 'ACeb53ee5949c9b6fb0144ee2950640007', '29900cb6ccbdd5cf37d2f0be4ea26778'
      message = @client.account.messages.create(:body => message,
                                                :to => phone_number,    # Replace with your phone number
                                                :from => '+15168304249')  # Replace with your Twilio numbe
      puts message.sid
    end
  end
end
