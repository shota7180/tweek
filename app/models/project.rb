class Project
  include Mongoid::Document
  field :user_id, :type => String
  field :name, :type => String
  field :email, :type => String
  field :report_frequency, :type => Integer
  field :continuous_days, :type => Integer
  field :percent, :type => Integer
  field :isbonus, :type => Boolean
  field :create_at, :type => Time
end
