class UserMailer < ApplicationMailer
  default from: "noreply@comiczone.herokuapp.com"
  def welcome_email(user)
    @user = user
    @url = "https://comiczone.herokuapp.com"
    mail(
    to: user.email,
    subject: "Welcome to the COMICZONE, #{user.username}!"
    )
  end

  def weekly_email(email)
    @url = "https://comiczone.herokuapp.com"
    mail(
    to: email,
    subject: "Don't forget to pick up your comics!"
    )
  end
end
