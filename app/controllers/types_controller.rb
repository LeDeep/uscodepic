class TypesController < ApplicationController
  helper_method :sort_column, :sort_direction 
  load_and_authorize_resource 

  def create
    @type = Type.new(params[:type])

    if @type.save
      flash[:notice] = "Your type was successfully created! YAY!"
      redirect_to types_path

    else
      render :new
      flash[:alert] = "Please make sure all fields are filled in and try again."
    end
  end

  def index
    @types = Type.all
    @types = Type.order(sort_column + " " + sort_direction)
  end

  def update
    @type = Type.find(params[:id])
    if @type.update_attributes(params[:type])
      flash[:notice] = "Your type was successfully updated! WOO!"
      redirect_to type_path
    else
      render :edit
    end
  end

  def show
    @type = Type.find(params[:id])
    @tools = Tool.all
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    flash[:notice] = "Your type was successfully deleted."
    redirect_to types_path
  end
end

private

def sort_column
  Type.column_names.include?(params[:sort]) ? params[:sort] : 'format'    
end

def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  
end