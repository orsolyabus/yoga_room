class TeacherLoginReminderMailer < ApplicationMailer
  track open: true

  def send_reminder(user)
    @user = user
    @yoga_classes = YogaClass.where(profile: user.profile).includes(:schedule, :location)
    mail(
      to: @user.email,
      subject: "Are your yoga classes still up to date?"
    )
  end
end
