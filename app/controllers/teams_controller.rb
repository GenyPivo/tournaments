class TeamsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_team, only: [:edit, :destroy, :update]

  def index
    @teams = Team.all
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

  def destroy
    if @team.destroy
      redirect_to root_path
    end
  end

  def edit

  end

  private

  def find_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :logo)
  end
end