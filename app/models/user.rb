class User < ActiveRecord::Base
	has_many :relations
	acts_as_messageable

	def mailboxer_email(object)
	#Check if an email should be sent for that object
	#if true
		return "define_email@on_your.model"
	#if false
	#return nil
	end
end
