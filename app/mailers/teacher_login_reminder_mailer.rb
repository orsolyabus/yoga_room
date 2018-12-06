class TeacherLoginReminderMailer < ApplicationMailer
  track open: true

  def send_reminder(user)
    @user = user
    @yoga_classes = YogaClass.where(user: user).includes(:schedule, :location)
    mail(
      to: @user.second_email,
      subject: "Are your yoga classes still up to date?"
    )
  end
end
