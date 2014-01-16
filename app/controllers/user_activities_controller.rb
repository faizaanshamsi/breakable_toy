class UserActivitiesController < ApplicationController

  def edit
    @user_activity = UserActivity.new
    @activity = Activity.find_by(params[:activity_id])
    @user_activity.activity_id = @activity.id
    @user_activity.user_id = current_user.id
    if @user_activity.save
      redirect_to user_path(current_user)
    else
      flash[:error] = 'Activity could not be added'
      redirect_to activities_path
    end
  end

end
