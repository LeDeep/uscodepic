class WordsController < ApplicationController
  
  load_and_authorize_resource

  def new
    @word = Word.new
  end

  def create
    @word = Word.new(params[:word])
    if @word.save
      flash.now[:notice] = "The word was successfully created."
      redirect_to new_word_definition_path(@word)
    else
      flash.now[:alert] = "There were errors creating the word."
      render :new
    end
  end

  def index
    @words = Word.all
  end
end
