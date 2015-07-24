class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def index
  	@users = User.all
  end

  def new
  	render :'users/new'
  end

  def create
  User.create(name:params[:name],password:params[:password],email:params[:email], password_confirmation:params[:password_confirmation])

  id=User.last.id
  session[:user_id]=id
  	redirect_to "/users/#{id}"
  end

  def show 
	@user = User.find(params[:id])
	@secrets = Secret1.all
  end

  def edit
@user= User.find(params[:id])
  end
	def update 
		user= User.find(params[:id])
		user.update(email:params[:email], name:params[:name])
		redirect_to "/users/#{params[:id]}"
	end
	def destroy 
		user=User.find(params[:id])
		user.delete
		session[:user_id] = nil
		redirect_to "/session/new"
	end
end
