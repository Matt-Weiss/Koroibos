class Api::V1::EventsController < ApplicationController

  def index
    render json: EventsSerializer.all_events
  end

end
