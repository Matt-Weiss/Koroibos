require 'rails_helper'

describe 'Events endpoint' do
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

  it 'returns all events as an array of sports' do
    get '/api/v1/events'
    data = JSON.parse(response.body)
    expect(data["events"][0]["sport"]).to eq("Diving")
  end
end
