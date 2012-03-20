class SessionsController < ApplicationController
	def callback
		auth = request.env["omniauth.auth"]
		#logger.debug(auth)
		#logger.debug("debug-------")
		user = User.find_by_provider_and_uid(auth["provider"], auth["uid"])
		if !user
		 user = User.create_with_omniauth(auth)
		else
			user.login(auth)
		end
		session[:user_id] = user.id
		if auth["provider"] == "facebook"
			session[:fb_access_token] = auth['credentials']['token']
		end
		if auth["provider"] == "twitter"
			session[:tw_access_token] = auth['credentials']['token']
			session[:tw_access_secret] = auth['credentials']['secret']
		end
		logger.debug(auth);
		redirect_to root_url, :notice => "login&quot"
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url, :notice => "Logged out"
	end
end
