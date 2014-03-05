class UsersController < ApplicationController
	def index
		
	end
	def show
		@user = User.find(params[:id])
	end
	def mailbox
		@user = User.find(params[:id])
		@conversations = @user.mailbox.inbox
	end
end
