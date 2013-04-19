class DefinitionsController < ApplicationController

  load_and_authorize_resource :word
  load_and_authorize_resource :definition, :through => :word

  def new
    word = Word.find(params[:word_id])
    @definition = word.definitions.build
  end

  def create
    if @definition.save
      redirect_to word_path(@definition.word), notice: "Your definition was successfully added to #{@definition.word.term}."
    else
      render :new
    end
  end

  def index
    @definitions = Definition.all
  end

  def show
    @word = Word.find(params[:id])
  end

  def edit
    @definition
  end

  def update
    @definition.update_attributes(:current => params[:current])
    redirect_to @word, notice: "Your definition was successfully added to #{@definition.word.term}."
  end
end
