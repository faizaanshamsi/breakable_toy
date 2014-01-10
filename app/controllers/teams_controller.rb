class TeamsController < ApplicationController
  before_filter :authenticate_user!

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    @team.captain_id = current_user.id
    if @team.save
      current_user.team_id = @team.id
      current_user.save
      redirect_to team_path(@team)
    else
      render :new
    end
  end

  def show
    @team = Team.find_by(id: params[:id])
  end

  private

  def team_params
    params.require(:team).permit(:name, :captain_id)
  end

end
