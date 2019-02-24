class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.follower_notification.subject
  #
  def follower_notification(user)
    @user = user

    mail to: user.email, subject: "Followed Notification"
  end
end
