class SimpleDeskController < ApplicationController
  before_filter :odesk_required
  
  def index
  end

  def team_rooms
    @team_rooms = RubyDesk::TeamRoom.get_teamrooms(@odesk_connector)
  end
end
