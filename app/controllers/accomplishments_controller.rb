class AccomplishmentsController < ApplicationController

  def new
    @activity = Activity.find_by(id: params[:activity_id])
    @accomplishment = Accomplishment.new
  end

  def create
    @user_activity = UserActivity.find_by(activity_id: params[:accomplishment][:activity_id], user_id: current_user.id)
    @accomplishment = Accomplishment.new(user_activity_id: @user_activity.id, duration: accomplishment_params[:duration], user: current_user)
    #NEED TO CREATE POINT FORMULA
    if @accomplishment.save
      @point = @accomplishment.points.build(quantity: 100, user: current_user, team: current_user.team)
      @point.save
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
