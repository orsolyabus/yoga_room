class TeacherLoginAlertJob < ApplicationJob
  queue_as :default

  def perform()
    # get the teachers filtered by last_login 
    teachers = User.where("last_login < ? AND is_teacher = ? ", 1.month.ago, true)
    # send them an email
    teachers.each do |teacher|
    puts "------------------"
    puts "send them an e-mail"
    TeacherLoginReminderMailer.send_reminder(teacher).deliver_later
    end
  end
end
