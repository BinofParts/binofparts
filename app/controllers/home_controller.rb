class HomeController < ApplicationController
	before_action :set_team, only: [:index]
	#before_action :get_event_ids
	def index
	    if current_user.admin?
			@requests = Request.where(:event_id => @event_ids).order("updated_at DESC")
		    # @events.sort!{|a,b|a.start_date <=> b.start_date}
		    @admins = User.where(:admin => true)
	    else
		    @requests = Request.where(:event_id => @event_ids).order("updated_at DESC")

		    @events.sort!{|a,b|a.start_date <=> b.start_date}
		    @myteam = User.where(:team_number_id => current_user.team_number_id)
		end
	end

	def update_feed
		time_ago = Time.now - 8.seconds
		@requests = Request.where("event_id in (?) and updated_at > ?", @event_ids, time_ago).order("updated_at DESC")
		  respond_to do |format|
		      format.js {render 'update_feed.js.erb'}
		  end
	end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_team
    	if not current_user.admin?
    		@team = Team.find_by_team_number(current_user.team_number_id)
    	end
    end

    def get_event_ids
    	@event_ids = []
	    @events = []
    	if current_user.admin?
    		@event_keys = ["2014flor", "2014flfo"]
	    	@event_keys.each_with_index do |event, index|
	    		@events << Event.find_by_key(event)
		       	@event_ids << @events[index].id
			end
    	else
    		@team.events.each_with_index do |event, index|
		       	@events << Event.find_by_key(event)
		       	@event_ids << @events[index].id
		    end
    	end
    end

end
