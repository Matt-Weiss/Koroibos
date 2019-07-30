require 'rails_helper'

describe 'Olympians endpoint' do
  before :each do
    event_1 = Event.create(games: "2016 Summer",
                           sport: "Diving",
                           event: "Diving Women's Platform")
    event_2 = Event.create(games: "2016 Summer",
                           sport: "Diving",
                           event: "Diving Men's Platform")
    event_3 = Event.create(games: "2016 Summer",
                           sport: "Swimming",
                           event: "Swimming Women's 100 metres Freestyle")
  end

  it 'can hit endpoint successfully' do
    get '/api/v1/events'
    expect(response.status).to eq(200)
  end
end
