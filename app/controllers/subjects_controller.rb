class SubjectsController < ApplicationController  
  helper_method :sort_column, :sort_direction
  load_and_authorize_resource 

  def create
    @subject = Subject.new(params[:subject])

    if @subject.save
      flash[:notice] = "Your subject was successfully created! YAY!"
      redirect_to subjects_path

    else
      render :new
      flash[:alert] = "Please make sure all fields are filled in and try again."
    end
  end

  def index
    @subjects = Subject.order(sort_column + " " + sort_direction)
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update_attributes(params[:subject])
      flash[:notice] = "Your subject was successfully updated! WOO!"
      redirect_to subject_path
    else
      render :edit
    end
  end

  def show
    @subject = Subject.find(params[:id])
    @tools = Tool.all
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    flash[:notice] = "Your subject was successfully deleted."
    redirect_to subjects_path
  end

end

private

def sort_column
  Subject.column_names.include?(params[:sort]) ? params[:sort] : 'category'    
end

def sort_direction
  %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  
end