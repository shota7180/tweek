# -*- coding: utf-8 -*-

include CommonHelper
class UserMailer < ActionMailer::Base
 default :from => "3week@gmail.com"
  def welcome_email(user)
    @user = user
	mail(:to => user.provider_email,
         :subject => "Welcome to My Awesome Site")
  end
  def support_email(user, project, support)
    @user = user
    @project = project
    @support= support
	mail(:to => user.provider_email,
         :subject => user.provider_name+"さんにサポーターが付きました！")
  end
end
