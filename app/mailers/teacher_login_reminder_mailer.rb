class TeacherLoginReminderMailer < ApplicationMailer
  def send_reminder(user)
    puts "sendi email to #{user.name}"
    @user = user
    @yoga_classes = YogaClass.where(user: user).includes(:schedule, :location)
    mail(
      to: @user.email,
      subject: "Are your yoga classes still up to date?"
    )
  end
end
