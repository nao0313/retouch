class UsersController < ApplicationController
  def show
    @fixes = current_user.fixes.order("created_at DESC").page(params[:page]).per(9)

  end
end
