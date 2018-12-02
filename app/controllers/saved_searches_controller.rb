class SavedSearchesController < ApplicationController
  before_action :authenticate_user!

  def create
    @saved_search = SavedSearch.new saved_search_params
    @saved_search.user = current_user
    
    # respond_to do |format|
    #   if @saved_search.save
    #     format.js
    #   else
    #     format.js {render :error}
    #   end
    # end
    if @saved_search.save
      flash[:success] = "Search saved"
      redirect_to yoga_classes_path
    else
      flash[:danger] = @saved_search.errors.full_messages.join(", ")
      redirect_to yoga_classes_path
    end
  end

  def destroy
    saved_search = SavedSearch.find params[:id]
    saved_search.destroy
    redirect_to user_path(saved_search.user)
  end

  def show
    saved_search = SavedSearch.find params[:id]
    puts JSON(saved_search[:params])
    render json: saved_search[:params]
  end

  private

  def saved_search_params
    params.require(:saved_search).permit(:name, :params)
  end
end
