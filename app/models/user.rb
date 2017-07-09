class User < ApplicationRecord
  extend ApplicationHelper
  def self.sendMoreJokesBitch

    @user = User.all.entries.each do |user|
      phone_number=user[:phone]
      smsMethod(phone_number)
    end
  end
end
