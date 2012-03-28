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
		(0..(project.continuous_days-1)).each do |num|
			check = checks.where(:number => num+1)
			if check.length > 0
				@ischecks[i][num] = true
			else
				@ischecks[i][num] = false 
			end	
		end
		i += 1
	end

  end
  #
  def check
	@project = Project.find(params[:project_id])
	@user= User.find(@project.user_id)
	number = params[:number]
	if params[:checkout]
		#checkout=true設定ならチェックを外す
		checks = Check.find(:all).where(:project_id=>@project.id,:number=>number)
		checks.each do |check|
			check.destroy
		end
	else
		check = Check.new
		check.project_id = @project.id
		check.number = number
		check.save
	end

	@day = @project.create_at+(number.to_i-1)*24*60*60
	
	#チェック配列[[true|false]]
	#@ischecks[project_num][day_num]
	@ischecks = []
	checks = Check.find(:all).where(:project_id => @project.id)
	(0..(@project.continuous_days-1)).each do |num|
		check = checks.where(:number => num+1)
		if check.length > 0
			@ischecks[num] = true
		else
			@ischecks[num] = false 
		end	
	end
  end

end
