class TeachersController < ApplicationController

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new teacher_params
    if @teacher.save
      flash[:success] = "thank you for signing up"
      redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  def show
    @teacher = Teacher.find params[:id]
  end

  def index
    @teachers = Teacher.all.order("name")
  end

  def edit
    @teacher = Teacher.find params[:id]
  end

  def update
    @teacher = Teacher.find params[:id]
    if @teacher.update teacher_params
      flash[:success] = "your infos are updated"
      redirect_to teacher_path(@teacher)
    else
      render :edit
    end
  end

  def destroy
    teacher = Teacher.find params[:id]
    teacher.destroy
    flash[:success] = "good bye and thank you for the fish"
    redirect_to root_path
  end

  private

  def teacher_params
    params.require(:teacher).permit(
      :name, :spiritual_name, :email,
      :phone, :image_url, :webpage_url, 
      :introduction, :public_contact,
      :password, :password_confirmation
    )
  end
end
