class AccomplishmentsController < ApplicationController

  def new
    @accomplishment = Accomplishment.new
  end

end
