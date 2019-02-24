# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/follower_notification
  def follower_notification
    user = User.first
    UserMailer.follower_notification(user)
  end

end
