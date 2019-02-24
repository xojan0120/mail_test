require 'rails_helper'

RSpec.feature "SendMails", type: :system do
  # perform_enqueued_jobsを使用するために必要
  include ActiveJob::TestHelper

  scenario "send mail test" do
    user = User.create(name: "xojan0120", email: "xojan0120.rails@gmail.com")

    visit root_path

    # メール送信
    # バックグラウンド送信のため、perform_enqueued_jobsを使う
    perform_enqueued_jobs do
      click_link "ここをクリック"
    end

    # ここまででメールは1通
    expect(ActionMailer::Base.deliveries.size).to eq 1

    # 最後に送ったメールを取り出す
    mail = ActionMailer::Base.deliveries.last

    # メールの内容を検証する
    aggregate_failures do
      expect(mail.to).to eq [user.email]
      expect(mail.subject).to eq "Followed Notification" # subjectはapp/mailers/user_mailer.rbで定義している
    end

    # メール送信
    # バックグラウンド送信のため、perform_enqueued_jobsを使う
    perform_enqueued_jobs do
      click_link "ここをクリック"
    end

    # ここまででメールは2通
    expect(ActionMailer::Base.deliveries.size).to eq 2
  end
end
