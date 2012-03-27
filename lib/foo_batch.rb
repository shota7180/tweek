class FooBatch
	def self.execute
		@users = User.find(:all)
		@users.each do |user|
			 UserMailer.welcome_email(user).deliver
			p "OK"
		end
	end
end
