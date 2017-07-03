class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = "https://comiczone.herokuapp.com"
    mail(
    to: user.email,
    subject: "Welcome to the COMICZONE, #{user.username}!"
    )
  end
end
