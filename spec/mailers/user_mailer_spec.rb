require "rails_helper"

RSpec.describe UserMailer, type: :mailer do
  describe "follower_notification" do
    let(:user) { User.create!(name:"john", email:"john@gmail.com") }
    let(:mail) { UserMailer.follower_notification(user) }

    it "renders the headers" do
      expect(mail.subject).to eq("Followed Notification")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["noreply@example.com"])
    end

    it "renders the body" do
      expect(mail.body.encoded).to match("Hi")
    end
  end

end
