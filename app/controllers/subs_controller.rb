class SubsController < ApplicationController
  before_action :require_login, only:[:edit, :update, :new, :create]
  
  
  def new 
    @sub = Sub.new 
    render :new 
  end 
  
  def show 
    @sub = Sub.find_by(id: params[:id])
    render :show 
  end 
  
  def index 
    @subs = Sub.all 
    render :index 
  end 
  
  def edit 
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end 
  
  def create
    @sub = Sub.new(sub_params)
    @sub.user_id = current_user.id
    if @sub.save 
      redirect_to sub_url(@sub) 
    else 
      flash.now[:errors] = @sub.errors.full_messages
      render :new 
    end 
  end 
  
  def update 
    @sub = current_user.subs.find_by(id: params[:id])
    if @sub
      @sub.update_attributes(sub_params)  
      redirect_to sub_url(@sub)
    else
      flash[:errors] = ["Oopps"]
      redirect_to subs_url
    end 
  end 
  
  private 
  
  def sub_params
    params.require(:sub).permit(:title, :description)
  end 
  
end
