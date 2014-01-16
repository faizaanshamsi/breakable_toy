class UsersController < ApplicationController

  def edit
    if current_user.has_team?
      flash[:error] = "You are already on a team!"
      redirect_to teams_path and return
    end
    @team = Team.find_by(id: params[:team_id])
    current_user.team_id = @team.id
    if current_user.save
      flash[:notice] = "You're a member of #{@team.name}!"
      redirect_to team_path(@team)
    else
      flash[:error] = "You can't join that team!"
      redirect_to teams_path
    end
end

  def show
    @user = current_user
    @activities = @user.activities
    @user_activities = UserActivity.where(user_id: @user.id)
  end

end
