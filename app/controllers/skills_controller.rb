class SkillsController < ApplicationController
  def new
    @skill = Skill.new
  end

  def index
    @skills = Skill.all
  end

  def create
    @skill = current_user.skills.new(params[:skill])
    if @skill.save
      redirect_to profile_path, :notice => "Skill added."
    else
      render :new
    end
  end
end
