class UserActivitiesController < ApplicationController

  def new
    @user_activity = UserActivity.new

    @activity = Activity.find_by(id: params[:activity_id])
    @user_activity.activity = @activity
    @user_activity.user = current_user
    if @user_activity.save
      redirect_to user_path(current_user)
    else
      flash[:error] = 'Activity could not be added'
      redirect_to activities_path
    end
  end

  def destroy
    @user_activity = UserActivity.find(params[:id])
    if @user_activity.destroy
      redirect_to user_path(current_user)
    else
      flash[:error] = "Could not destroy"
      redirect_to user_path(current_user)
    end
  end

end
