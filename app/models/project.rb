class Project
  include Mongoid::Document
  field :user_id, :type => String
  field :name, :type => String
  field :email, :type => String
  field :continuous_days, :type => Integer
  field :percent, :type => Integer
  field :create_at, :type => Time
end
