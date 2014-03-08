class Comment < ActiveRecord::Base
	belongs_to :project
	belongs_to :user

	include PublicActivity::Model
  	tracked
end
