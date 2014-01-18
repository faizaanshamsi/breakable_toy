class AccomplishmentsController < ApplicationController

  def new
    @activity = Activity.find_by(id: params[:activity_id])
    @accomplishment = Accomplishment.new
  end

  def create
    @user_activity = UserActivity.find_by(activity_id: params[:accomplishment][:activity_id], user_id: current_user.id)
    @accomplishment = Accomplishment.new(user_activity_id: @user_activity.id, duration: accomplishment_params[:duration])
    #NEED TO CREATE POINT FORMULA
    @point = Point.new(quantity: 100, user: current_user, team: current_user.team, accomplishment: @accomplishment)
    if @accomplishment.save && @point.save
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
