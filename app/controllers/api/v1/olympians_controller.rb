class Api::V1::OlympiansController < ApplicationController

  def index
    render json: OlympianSerializer.parse_olympians(search_params)
  end

  private

  def search_params
    params.permit(:age)
  end

end
