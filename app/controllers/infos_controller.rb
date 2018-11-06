class InfosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :delete]
  before_action :authorize_user!, only: [:new, :create, :edit, :update, :delete]

end
