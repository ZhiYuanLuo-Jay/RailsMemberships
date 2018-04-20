class UsersController < ApplicationController
  def main
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      redirect_to "/groups"
    else
      flash[:errors] = @user.errors.full_messages 
      redirect_to "/main"
    end
  end 

  def login
    # p params[:user][:email] return "zhiyuan!@g.com"
    # p params[:email] return nil, params is a dictionary
    @usr = User.find_by_email(params[:user][:email]).try(:authenticate, params[:user][:password])
    if @usr 
      session[:user_id] = @usr.id
      redirect_to "/groups"
    else
      flash[:errors] = ['Invalid Combination']
      redirect_to "/main"
    end 
  end 

  def logout
    # Log User out
    session[:user_id] = nil
    redirect_to "/main"
  end

private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  # def user_edit_params
  #   params.require(:user).permit(:first_name, :last_name, :email, :location, :state)
  # end


end
