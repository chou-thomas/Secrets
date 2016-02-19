class SessionController < ApplicationController
  
  def new
  end

  def create
  	@user = User.find_by_email(params[:email])
  	if @user.authenticate(params[:password])
  		session[:id] = @user.id
  		redirect_to "/users/#{@user.id}"
  	else 
  		flash[:loginerror] = "wrong password Bro"
  		redirect_to "/users/new"
  	end
  end

  def destroy

  end

end
