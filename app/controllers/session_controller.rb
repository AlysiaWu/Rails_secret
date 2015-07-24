class SessionController < ApplicationController
  def new
  	render :'session/new'
  end

  def create
  	# render :text=>"<%=params[:email]%>"
  	user = User.find_by(email:params[:email])
  	# if user&&user.password_digest == params[:password]
  	if user&&user.authenticate(params[:password])
  		session[:user_id]=user.id
  		session[:name]=user.name
  		redirect_to "/users/#{session[:user_id]}"

  	else 
  		flash[:errors]='Invalid'
  		redirect_to "session/new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to '/session/new'
  end
end
