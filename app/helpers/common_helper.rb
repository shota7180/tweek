module CommonHelper
	def getCheckUrl(date,project_id)
		return settings.site_url+"users/check"+"?date="+date.to_s+"&project_id="+project_id.to_s
	end
	def getCheckOutUrl(date,project_id)
		return settings.site_url+"users/check"+"?date="+date.to_s+"&project_id="+project_id.to_s+"&checkout=true"
	end
end
