require "rails_helper"

RSpec.describe TeacherLoginReminderMailer, type: :mailer do
  before do
    @user = FactoryBot.create(:user)
    @profile =FactoryBot.create(:profile, user: @user)
    @email = TeacherLoginReminderMailer.send_reminder(@user).deliver
    @yoga_classes = [
      FactoryBot.create(:yoga_class, profile: @profile),
      FactoryBot.create(:yoga_class, profile: @profile),
      FactoryBot.create(:yoga_class, profile: @profile),
    ]
  end

  it "enques the email" do
    expect(ActionMailer::Base.deliveries).not_to be_empty
  end

  it "has the correct address" do
    expect(@email.to).to eq([@user.email])
  end

  it "has the correct sender" do
    expect(@email.from).to eq(["from@example.com"])
  end

  it "has the correct subject" do
    expect(@email.subject).to eq("Are your yoga classes still up to date?")
  end

  it "has the correct content" do
    expect(@email.body.encoded).to match("Hi")
  end
end
