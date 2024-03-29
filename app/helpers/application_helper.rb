module ApplicationHelper
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
end
