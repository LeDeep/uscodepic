class DashboardController < ApplicationController
  def index
    @happenings = [HelpRequest.all, Definition.all].flatten.sort {|a,b| a.created_at <=> b.created_at}
  end
end