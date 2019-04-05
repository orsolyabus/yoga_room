class SearchAlertMailer < ApplicationMailer
  track open: true, click: true
  
  def send_search_alert(user_id, searches, yoga_class)
    @user = User.find(user_id)
    @search_names = searches.map{ |s| s.name }.join(", ")
    @yoga_class = yoga_class
    mail(
      to: @user.email,
      subject: "new yoga class that matches your #{@search_names} search(es)!"
    )
  end
end
