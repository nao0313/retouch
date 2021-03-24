class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]


  def show
     @user = User.find(params[:id])
     @fixes = @user.fixes.order("created_at DESC").page(params[:page]).per(10)
  end

 
end
