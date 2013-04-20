class DashboardController < ApplicationController
  def index
    @happenings = [HelpRequest.all, Definition.all].flatten.sort {|a,b| a.created_at <=> b.created_at}
    @stories = Story.all
    @comments = Comment.all
  end
end