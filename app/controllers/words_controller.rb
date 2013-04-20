class WordsController < ApplicationController
  
  load_and_authorize_resource

  def new
    @word = Word.new
    @new_word = params[:new_word]
  end

  def create
    @word = current_user.words.new(params[:word])
    if @word.save
      flash.now[:notice] = "The word was successfully created."
      redirect_to new_word_definition_path(@word, :new_word => true)
    else
      render :new
    end
  end

  def show
    @definitions = Word.find(params[:id]).definitions_in_order
  end

  def index
    @words = Word.all
  end
end
