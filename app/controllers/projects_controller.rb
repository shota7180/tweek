include SnsHelper
class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json
  def index
    @projects = Project.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @project = Project.find(params[:id])
	@user = User.find(@project.user_id)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @project = Project.new
	@project.email = current_user.provider_email

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @project = Project.new(params[:project])
	@project.user_id = session[:project_user_id]
	@project.name = session[:project_name]
	@project.email = session[:project_email]
	@project.continuous_days = session[:project_continuous_days]*7
	@project.percent = session[:project_percent]
	@project.create_at = session[:project_create_at]
	current_user.provider_email = @project.email
	current_user.save

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  def confirm
    @project = Project.new(params[:project])
	@project.user_id = current_user.id
	@project.create_at = Time.now
	@user = User.find(@project.user_id)
	session[:project_user_id] = @project.user_id
	session[:project_name] = @project.name
	session[:project_email] = @project.email
	session[:project_continuous_days] = @project.continuous_days
	session[:project_percent] = @project.percent
	session[:project_create_at] = @project.create_at
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
	@checks = Check.find(:all).where(:project_id => @project.id)
	@checks.each do |check|
		check.destroy
	end
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
end
