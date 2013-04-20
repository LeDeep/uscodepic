class WordsController < ApplicationController
  
  load_and_authorize_resource

  def new
    @word = Word.new
  end

  def create
    @word = current_user.words.new(params[:word])
    if @word.save
      flash.now[:notice] = "The word was successfully created."
      redirect_to new_definition_path(:word_id => @word.id)
    else
      flash.now[:alert] = "There were errors creating the word."
      render :new
    end
  end

  def index
    @words = Word.all
  end

  def show
    @definitions = Word.find(params[:id]).definitions_in_order
  end

  def index
    @words = Word.all
  end

end
