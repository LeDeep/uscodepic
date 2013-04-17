class HelpRequestsController < ApplicationController
  def new
    @help_request = HelpRequest.new
  end

  def create
    @help_request = current_user.help_requests.build(params[:help_request])
    if @help_request.save
      redirect_to help_requests_path, :notice => 'Help request opened.'
    else
      render :new
    end
  end

  def index
    @help_requests = HelpRequest.all
  end

  def show
    @help_request = HelpRequest.find(params[:id])
  end
end
