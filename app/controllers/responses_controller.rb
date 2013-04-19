class ResponsesController < ApplicationController
  load_and_authorize_resource :help_request
  load_and_authorize_resource :response, :through => :help_request, :only => [:new, :create]

  def create
    # if @response.save
    #   redirect_to @response.help_request, :notice => 'Your response was posted.'
    # else
    #   render :new
    # end
    # help_request = HelpRequest.find(params[:help_request_id])
    p @help_request.closed
    if @help_request.closed == false
      if @response.save
        puts "here"
        redirect_to @response.help_request, :notice => 'Your response was posted.'
      else
        render :new
      end
    else
      redirect_to help_request_path(@help_request), :alert => 'This post is closed.'
    end
  end
end
