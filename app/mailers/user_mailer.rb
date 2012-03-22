include CommonHelper
class UserMailer < ActionMailer::Base
 default :from => "3week@gmail.com"
  def welcome_email(user)
    @user = user
	project = Project.last(:conditions => { :user_id => user.id })
    @url = "http://3week.me/" 
	mail(:to => user.provider_email,
         :subject => "Welcome to My Awesome Site")
  end
end
