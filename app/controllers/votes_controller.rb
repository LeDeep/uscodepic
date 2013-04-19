class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @vote = Definition.find(params[:definition_id]).votes.create(params[:vote])

    if @vote.save
      flash[:notice] = 'Thanks for voting.'
      redirect_to @vote.definition.word
    end
  end

  def index
    @votes = Vote.all
  end
end
