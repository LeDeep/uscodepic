class HelpRequestsController < ApplicationController
  load_and_authorize_resource :only => [:new, :create, :index, :show]

  def create
    if @help_request.save
      redirect_to help_requests_path, :notice => 'Help request opened.'
    else
      render :new
    end
  end
end
