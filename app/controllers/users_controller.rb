class UsersController < ApplicationController
  def show
    @fixes = current_user.fixes.order("created_at DESC")

  end
end
