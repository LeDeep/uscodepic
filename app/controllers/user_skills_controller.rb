class UserSkillsController < ApplicationController
  def create
    current_user.user_skills.create(:skill => Skill.find(params[:skill_id]))
    redirect_to profile_path, :notice => 'Skill added to your profile.'
  end

  def destroy
    UserSkill.find(params[:id]).destroy
    redirect_to profile_path, :notice => 'Skill removed.'
  end
end
