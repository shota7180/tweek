include CommonHelper
class UsersController < ApplicationController
  def mypage 
	@user = current_user
	@projects = Project.find(:all).where(:user_id => @user.id).desc(:created_at)
	#UserMailer.welcome_email(@user).deliver

	i = 0
	#チェック配列[[true|false]]
	#@ischecks[project_num][day_num]
	@ischecks = []
	@projects.each do |project|
		@ischecks[i] = []
		checks = Check.find(:all).where(:project_id => project.id)
		(0..(project.continuous_days-1)).each do |j|
			check = checks.where(:date => project.create_at+j)
			if check.length > 0
				@ischecks[i][j] = true
			else
				@ischecks[i][j] = false 
			end	
		end
		i += 1
	end
  end
  #
  def check
	@project = Project.find(params[:project_id])
	@user= User.find(@project.user_id)
	@date = Date.strptime(params[:date], "%Y-%m-%d") 
	if params[:checkout]
		#checkout=true設定ならチェックを外す
		checks = Check.find(:all).where(:project_id=>@project.id,:date=>@date)
		checks.each do |check|
			check.destroy
		end
	else
		if Check.find(:all).where(:date=>@date).length == 0
			check = Check.new
			check.project_id = @project.id
			check.date = @date
			check.save
		end
	end
	#チェック配列[[true|false]]
	#@ischecks[project_num][day_num]
	@ischecks = []
	checks = Check.find(:all).where(:project_id => @project.id)
	(0..(@project.continuous_days-1)).each do |i|
		check = checks.where(:date => @project.create_at+i)
		if check.length > 0
			@ischecks[i] = true
		else
			@ischecks[i] = false 
		end	
	end
  end
end
