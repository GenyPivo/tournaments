class TournamentsController < ApplicationController
  before_action :find_tournament, except: [:index]
  before_action :authenticate_user!

  def index
    @tournaments = Tournament.all
  end

  def participate
    if !@tournament.teams.include? current_user.team
      @tournament.teams << current_user.team
      render json: { status: 'success', action: 'part', item: 'team' }
    else
      render json: { status: 'error', message: 'Already exists' }, status: 422
    end
  end

  def exit
    team = @tournament.teams.find(current_user.team.id)
    if @tournament.teams.delete(team)
      render json: { status: 'success', action: 'exit', item: 'team' }
    end
  end

  def show
    @teams = @tournament.teams
  end

  private

  def find_tournament
    @tournament = Tournament.find(params[:id])
  end
end