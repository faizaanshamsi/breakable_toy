class ActivitiesController < ApplicationController

  def index
    @activities = Activity.all
    @user = current_user
  end

end
