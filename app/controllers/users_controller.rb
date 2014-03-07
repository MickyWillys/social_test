class UsersController < ApplicationController
	def index
		
	end
	def show
		@user = User.find(params[:id])
		@projects = @user.projects
	end
	def mailbox
		@user = User.find(params[:id])
		@conversations = @user.mailbox.inbox
	end
end
