class Check 
  include Mongoid::Document
  field :project_id, :type => String
  field :number, :type => Integer
end
