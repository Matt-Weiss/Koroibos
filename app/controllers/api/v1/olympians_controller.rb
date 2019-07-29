class Api::V1::OlympiansController < ApplicationController

  def index
    render json: OlympianSerializer.all_olympians
  end

end
