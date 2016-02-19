class UserController < ApplicationController
  
  def new
  end

  def index
  end

  def create
  	if params[:password] == params[:confirm_password]
  		User.create(name: params[:name], email: params[:email], password: params[:password])
  		redirect_to "/sessions/new"
  	else
  		flash[:error] = "something went wrong"
  		redirect_to "/users/new"
  	end
  end

  def show
  	@user = User.find(params[:id])
  end
end
