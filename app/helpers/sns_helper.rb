module SnsHelper
	def post( user, text )
		if user.provider == "twitter"
			self.tweet(user,text)
		end 
		if user.provider == "facebook"
			self.post_feed(user,text)
		end
	end
	# twitter
	def tweet( user, text )
		Twitter.configure do |config|
			config.consumer_key       = settings.twitter_consumer_key
			config.consumer_secret    = settings.twitter_consumer_secret
			config.oauth_token        = user.token
			config.oauth_token_secret = user.secret
		end
		 
		twitter_client = Twitter::Client.new
		twitter_client.update(text)
	end
	# facebook
	def post_feed( user, text )
		client ||= RestGraph.new(:access_token => user.token)
		client.post("me/feed", {:message=>text}) 
	end
end
