class Support
	include Mongoid::Document
	field :project_id, :type => String
	field :guest_name, :type => String
	field :guest_email, :type => String
	field :prize, :type => String
end
