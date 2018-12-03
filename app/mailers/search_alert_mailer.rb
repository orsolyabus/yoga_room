class SearchAlertMailer < ApplicationMailer

  def send_search_alert( search, yoga_class)
    @user = search.user
    @search = search
    @yoga_class = yoga_class
    mail(
      to: @user.email,
      subject: "new yoga class that matches your #{@search.name} search!"
    )
  end
end
