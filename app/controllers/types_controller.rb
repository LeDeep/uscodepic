class TypesController < ApplicationController
  
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

  def update
    @type = Type.find(params[:id])
    if @type.update_attributes(params[:type])
      flash[:notice] = "Your type was successfully updated! WOO!"
      redirect_to type_path
    else
      render :edit
    end
  end

  def destroy
    @type = Type.find(params[:id])
    @type.destroy
    flash[:notice] = "Your type was successfully deleted."
    redirect_to types_path
  end
end