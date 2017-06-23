require 'twilio-ruby'

class WelcomeController < ApplicationController
  include WelcomeHelper
  include ApplicationHelper

  def home
  end


  def sms
    smsMethod("+1"+params[:number])
  end


end
