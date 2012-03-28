class Tasks::HelloTask
	def self.execute
		@users = User.find(:all)
		@users.each do |user|
			 UserMailer.welcome_email(user).deliver
			p "mail deliver "+user.provider_email
		end
	end
end
