class UsersController < ApplicationController
  def index
  end

  def send_mail
    # deliver_laterで非同期送信
    # 即時送信したい場合は、deliver_now
    UserMailer.follower_notification(User.first).deliver_later
    flash[:info] = "送信しました"
    redirect_to root_url
  end
end
