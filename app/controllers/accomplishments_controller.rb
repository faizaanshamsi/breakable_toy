class AccomplishmentsController < ApplicationController

  def new
    @activity = Activity.find_by(id: params[:activity_id])
    @accomplishment = Accomplishment.new
  end

  def create
    @user_activity = UserActivity.find_by(activity_id: params[:accomplishment][:activity_id], user_id: current_user.id)
    @accomplishment = Accomplishment.new(user_activity_id: @user_activity.id, duration: accomplishment_params[:duration])
    #NEED TO CREATE POINT FORMULA
    if @accomplishment.save
      @point = Point.create(quantity: 100, user_id: current_user, team_id: current_user.team.id, accomplishment_id: @user_activity.id)
      binding.pry
      flash[:notice] = 'Accomplishment saved!'
      redirect_to user_path(current_user)
    else
      flash[:error] = 'Could not create accomplishment'
      redirect_to user_path(current_user)
    end
  end

  def accomplishment_params
    params.require(:accomplishment).permit(:duration)
  end
end
