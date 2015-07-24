class SecretsController < ApplicationController
	  before_action :require_login, only: [:index, :create, :destroy]
  def index
  	@secrets = Secret1.all
  end

def create
	# render :text=>"haha"

	Secret1.create(content:params[:content], user_id:params[:user_id])
	redirect_to "/users/#{session[:user_id]}"
end
def destroy
	secret=Secret1.find(params[:id])
	secret.delete if secret.user==current_user
	redirect_to "/users/#{session[:user_id]}"
end

end
