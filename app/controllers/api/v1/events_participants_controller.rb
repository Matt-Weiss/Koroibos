class Api::V1::EventsParticipantsController < ApplicationController

  def index
    render json: EventsSerializer.all_participants
  end

end
