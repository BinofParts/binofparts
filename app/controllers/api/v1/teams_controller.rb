class API::V1::TeamsController < API::V1::ApplicationController
  respond_to :json
  
  before_action :set_team, only: [:show]

  # GET /teams
  def index
    respond_with(Team.all, :only => [:id, :team_number, :nickname, :name, :key, :website, :locality, :region, :country_name, :location, :events])
  end

  # GET /teams/1
  def show
    respond_with(@team, :only => [:id, :team_number, :nickname, :name, :key, :website, :locality, :region, :country_name, :location, :events])
  end

  private
    def set_team
      @team = Team.find(params[:id])
    end

end