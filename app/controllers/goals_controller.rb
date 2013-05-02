class GoalsController < ApplicationController

  helper_method :sort_column, :sort_direction
  load_and_authorize_resource 

  def new
    @subjects = Subject.all
    @types = Type.all
    @tool = Tool.find(params[:tool_id])
    @goal = Goal.new(:tool_id => params[:tool_id])
  end

  def create
    current_user.goals.create!(:tool_id => (params[:goal][:tool_id]), :status => (params[:goal][:status]))
    redirect_to tools_path, :notice => 'Goal Added!'
  end

  def index
    @goals = Goal.all
    @tools = Tool.all
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update_attributes(params[:goal])
      flash[:notice] = "Your goal was successfully updated! WOO!"
      redirect_to goal_path
    else
      render :edit
    end
  end

  def edit
    @goal = Goal.find(params[:id])
    @subjects = Subject.all
    @types = Type.all
    @tools = Tool.all
  end  

  def show
    @goal = Goal.find(params[:id])
  end

  def destroy
    @goal = Goal.find(params[:id])
    @goal.destroy
    flash[:notice] = "Your goal was successfully deleted."
    redirect_to goals_path
  end

  private

  def sort_column
    Goal.column_names.include?(params[:sort]) ? params[:sort] : 'name'    
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
    
  end
end
