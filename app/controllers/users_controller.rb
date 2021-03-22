class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]


  def show
    # @fixes = current_user.fixes.order("created_at DESC").page(params[:page]).per(9)
     @user = current_user
     @fixes = @user.fixes.order("created_at DESC").page(params[:page]).per(9)
  end

 
end
