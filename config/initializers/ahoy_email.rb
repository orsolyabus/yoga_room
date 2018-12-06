AhoyEmail.api = true

class EmailSubscriber
  def open(event)
    event[:user].update(last_login: Time.now)
    event[:controller].ahoy.track "Email opened", message_id: event[:message].id
  end

  def click(event)
    # your code
  end
end

AhoyEmail.subscribers << EmailSubscriber.new
