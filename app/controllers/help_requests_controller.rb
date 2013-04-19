class HelpRequestsController < ApplicationController
  load_and_authorize_resource :only => [:new, :create, :update, :index, :show]

  def create
    if @help_request.save
      redirect_to help_requests_path, :notice => 'Help request opened.'
    else
      render :new
    end
  end

  def update
    help_request = HelpRequest.find(params[:id])
    help_request.update_attributes(:closed => true)
    redirect_to :back, :notice => 'This help request was closed.'
  end  
end
