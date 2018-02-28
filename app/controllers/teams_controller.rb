class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index

  end

  def new
    @team = Team.new
  end

  def create
    team = Team.new(team_params)
    team.user = current_user
    if team.save
      redirect_to root_path
    end
  end

  def team_params
    params.require(:team).permit(:name, :logo)
  end
end