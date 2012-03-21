class UsersController < ApplicationController
  def mypage 
	@user = current_user

	@projects = Project.find(:all).where(:user_id => @user.id).desc(:created_at)

	test_check = Check.new
	test_check.project_id = @projects[0].id
	test_check.number = 4
	test_check.ischeck = true
	#test_check.save
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
end
