class SimpleDeskController < ApplicationController
  before_filter :odesk_required
  
  def index
    @work_diary = {}
    RubyDesk::TeamRoom.get_teamrooms(@odesk_connector).each do |team_room|
      work_diary = RubyDesk::Snapshot.work_diary(@odesk_connector, team_room.id, @odesk_connector.auth_user.uid)
      @work_diary[team_room] = work_diary.first if work_diary
    end

    # Find profile of the current user
    # There's no direct way to find current user profile
    # Search for providers with the name and select one of them
    # some_users = RubyDesk::Provider.search(@odesk_connector, "#{@odesk_connector.auth_user.first_name} #{@odesk_connector.auth_user.last_name}")
    # if some_users
    #   user_profile = some_users.find do |u|
    #     u.dev_userid == @odesk_connector.auth_user.uid
    #   end
    # end
    # 
    # if user_profile
    #   # Find one job for each skill for the profile (maximum 5 skills)
    #   @jobs = {}
    #   user_profile.skills[0,5].each do |skill|
    #     jobs = RubyDesk::Job.search(@odesk_connector, skill.skl_name)
    #     @jobs[skill] = jobs.first if jobs
    #   end
    # end
  end

  def team_rooms
    @team_rooms = RubyDesk::TeamRoom.get_teamrooms(@odesk_connector)
  end
end
