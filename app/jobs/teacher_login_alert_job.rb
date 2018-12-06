class TeacherLoginAlertJob < ApplicationJob
  queue_as :default

  def perform()
    teachers = User.where("last_login < ? AND is_teacher = ? ", 1.month.ago, true)
    teachers.each do |teacher|
    TeacherLoginReminderMailer.send_reminder(teacher).deliver_later
    end
  end
end
