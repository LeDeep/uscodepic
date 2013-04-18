class ResponsesController < ApplicationController
  load_and_authorize_resource :help_request
  load_and_authorize_resource :response, :through => :help_request, :only => [:new, :create]

  def create
    if @response.save
      redirect_to @response.help_request, :notice => 'Your response was posted.'
    else
      render :new
    end
  end
end
