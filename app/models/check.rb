class Check 
  include Mongoid::Document
  field :project_id, :type => String
  field :date , :type => Date 
end
