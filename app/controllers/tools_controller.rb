class ToolsController < ApplicationController

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(params[:tool])
    if @tool.save
      flash[:notice] = "Tool Added!"
      redirect_to root_path
    else
      flash[:alert] = "Something went very wrong."
      # render :new
    end
  end

  def show
    
  end

  def index
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end
end