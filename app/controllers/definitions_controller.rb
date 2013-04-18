class DefinitionsController < ApplicationController

  load_and_authorize_resource

  def new
    @definition = Definition.new
  end

  def create
    word = Word.find(params[:definition][:word_id])
    if @definition = word.definitions.create(params[:definition].merge({:user_id => current_user.id}))
      redirect_to words_path, notice: "The definition was successfully created."
    else
      flash.now[:alert] = "There were errors creating the definition."
      render :new
    end
  end

  def index
    @definitions = Definition.all
  end

  def show
    @word = Word.find(params[:id])
  end
end

