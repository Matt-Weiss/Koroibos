class Api::V1::MedalistsController < ApplicationController

  def index
    render json: EventsSerializer.medalists(search_params[:event_id])
  end

  private

  def search_params
    params.permit(:event_id)
  end

end
