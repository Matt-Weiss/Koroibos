class Api::V1::OlympiansController < ApplicationController

  def index
    render json: OlympianSerializer.parse_olympians
  end

end
