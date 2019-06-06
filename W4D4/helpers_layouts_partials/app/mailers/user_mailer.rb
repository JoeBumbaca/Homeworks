class UserMailer < ApplicationMailer
  default from: 'hey_there@helloooooo.com'

  def welcome_email(user)
    @user = user
    @url = 'http://
  end
end
