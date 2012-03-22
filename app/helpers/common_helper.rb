module CommonHelper
	def getCheckUrl(number,project_id)
		return settings.site_url+"users/check"+"?number="+number.to_s+"&project_id="+project_id.to_s
	end
	def getCheckOutUrl(number,project_id)
		return settings.site_url+"users/check"+"?number="+number.to_s+"&project_id="+project_id.to_s+"&checkout=true"
	end
end
