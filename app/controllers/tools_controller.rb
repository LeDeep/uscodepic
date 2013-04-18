class ToolsController < ApplicationController
  helper_method :sort_column, :sort_direction
  load_and_authorize_resource 

  def new
    @subjects = Subject.all
    @types = Type.all
  end

  def create
    if @tool.save
      flash[:notice] = "Tool Added!"
      redirect_to tools_path
    else
      flash[:alert] = "Something went very wrong."
      render :new
    end
  end

  def index
    @tools = Tool.order(sort_column + " " + sort_direction)
    
  end

  def update
    @tool = Tool.find(params[:id])
    if @tool.update_attributes(params[:tool])
      flash[:notice] = "Your tool was successfully updated! WOO!"
      redirect_to tool_path
    else
      render :edit
    end
  end

  def edit
    @tool = Tool.find(params[:id])
    @subjects = Subject.all
    @types = Type.all
  end  

  def show
    @tool = Tool.find(params[:id])
  end

  def destroy
    @tool = Tool.find(params[:id])
    @tool.destroy
    flash[:notice] = "Your tool was successfully deleted."
    redirect_to subjects_path
  end

  private

  def sort_column
    Tool.column_names.include?(params[:sort]) ? params[:sort] : 'name'    
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    
  end
end