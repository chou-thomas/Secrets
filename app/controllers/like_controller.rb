class LikeController < ApplicationController
	def create
		user = User.find(session[:id])
		secret = Secret.find(params[:sec_id])
		Like.create(user: user, secret: secret)

		redirect_to "/secrets"
	end

	def destroy
		user = User.find(session[:id])
		secret = Secret.find(params[:sec_id])
		like = secret.likes.find_by(user_id: session[:id])
		like.destroy

		redirect_to "/secrets"
	end
end
