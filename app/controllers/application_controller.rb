class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include ApplicationHelper
  def sendMoreJokesBitch
    @user = User.all.entries.each do
      @user = User.find(:id)
      smsMethod("+1" + @user.phone)
    end
  end


end
