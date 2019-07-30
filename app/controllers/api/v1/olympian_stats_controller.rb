class Api::V1::OlympianStatsController < ApplicationController

  def index
    render json: OlympianStatsSerializer.all_olympians
  end

end
