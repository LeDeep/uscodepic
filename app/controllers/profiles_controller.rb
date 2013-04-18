class ProfilesController < ApplicationController
  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    if @profile.update_attributes(params[:profile])
      redirect_to profile_path, :notice => "You have successsfully updated your profile."
    else
      render :edit
    end
  end
end
