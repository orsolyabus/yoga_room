class IssuesController < ApplicationController
  
  def create
    @issue = Issue.new(issue_params)
    if @issue.save
      flash[:success] = "Message sent."
      redirect_to root_path
    else
      render "../home/contact"
    end
  end
  
  def update
    @issue = Issue.find(params[:id])
    if @issue.update(issue_params)
      flash[:success] = "issue updated."
      redirect_to root_path
    else
      render "../home/contact"
    end
  end
  
  private
   
  def issue_params
    params.require(:issue).permit(:sender, :subject, :message, :solved) 
  end
  
end
