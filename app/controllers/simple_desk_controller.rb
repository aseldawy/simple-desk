class SimpleDeskController < ApplicationController
  before_filter :odesk_required
  
  def index
    @time_report = RubyDesk::TimeReport.find(@odesk_connector,
        :select=>"team_name, sum(hours)",
        :conditions=>{:worked_on=>Date.today.monday, :provider_id=>@odesk_connector.auth_user.uid})
    if @time_report && @time_report.size > 1
      total_hours = @time_report.sum{|entry| entry['hours']}
      @time_report.insert(0, {'team_name'=>"total", 'hours'=>total_hours})
    end
  end
  
  def search_jobs
    @jobs = RubyDesk::Job.search(@odesk_connector, params[:query])
  end

  def team_rooms
    @team_rooms = RubyDesk::TeamRoom.get_teamrooms(@odesk_connector)
  end
end
