class LikeController < ApplicationController
def click
	Like.create(user_id: current_user.id, secret_id:params[:secret_id])
	redirect_to '/secrets'

end 

end
