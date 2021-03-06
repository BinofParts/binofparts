class API::V1::EventsController < API::V1::BaseController
  respond_to :json
  
  before_action :set_event, only: [:show]

  # GET /events
  def index
    respond_with(Event.all, :only => [:key, :name, :short_name, :start_date, :end_date, :official])
  end

  # GET /events/1
  def show
    respond_with(@event, :only => [:key, :name, :short_name, :start_date, :end_date, :official])
  end

  private
    def set_event
      @event = Event.find_by_key(params[:id])
    end

end