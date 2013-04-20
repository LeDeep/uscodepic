class VotesController < ApplicationController

  def new
    @vote = Vote.new
  end

  def create
    @vote = current_user.votes.create!(params[:vote].merge(:definition => Definition.find(params[:definition_id])))

    if @vote.save
      flash[:notice] = 'Thanks for voting.'
      redirect_to @vote.definition.word
    end
  end

  def index
    @votes = Vote.all
  end
end
