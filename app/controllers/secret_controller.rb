class SecretController < ApplicationController
  def index
  	@user = User.find(session[:id])
  	@secrets = Secret.all
  end

  def create
  	user = User.find(session[:id])
  	Secret.create(message: params[:message], user: user)

  	redirect_to "/users/#{user.id}"
  end

  def destroy
  	sec = Secret.find(params[:secret_id])
  	sec.destroy

  	redirect_to "/users/#{session[:id]}"
  end
end
