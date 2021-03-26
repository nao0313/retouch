class FixesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]

  def index
    @fixes = Fix.all.order("created_at DESC").page(params[:page]).per(15)
  end
  
  def new
    @fixes = Fix.new
  end

  def create
    @fixes = Fix.new(fixes_params)
    if @fixes.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def show
    @fixes = Fix.find(params[:id])
    @message = Message.new
    @messages = @fixes.messages.includes(:user)
  end

  def edit
    @fixes = Fix.find(params[:id])
  end

  def update
    @fixes = Fix.find(params[:id])
    if @fixes.update(fixes_params)
      redirect_to user_path(@fixes.user)
    else
      render :edit
    end
  end

  def destroy
    @fixes = Fix.find(params[:id])
    redirect_to root_path if @fixes.destroy
  end
  
  private

  def fixes_params
    params.require(:fix).permit(:image, :title, :comment, :genre_id).merge(user_id: current_user.id)
  end
end
