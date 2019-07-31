class Api::V1::TeamMedalsController < ApplicationController

  def index
    render json: TeamsSerializer.medal_count
  end

end
