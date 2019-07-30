require 'rails_helper'

describe 'Olympians endpoint' do
  before :each do
    olympian_1 = Olympian.create(name: "Maha Abdalsalam Gouda",
                                  sex: "F",
                                  age: 18,
                               height: 172,
                               weight: 61,
                                 team: "Egypt")
    olympian_2 = Olympian.create(name: "Ahmad Abughaush",
                                  sex: "M",
                                  age: 20,
                               height: 178,
                               weight: 68,
                                 team: "Jordan")
    olympian_3 = Olympian.create(name: "Ana Iulia Dascl",
                                  sex: "M",
                                  age: 13,
                               height: 183,
                               weight: 60,
                                 team: "Romania")

    @event_1 = Event.create(games: "2016 Summer",
                           sport: "Diving",
                           event: "Diving Women's Platform")
    @event_2 = Event.create(games: "2016 Summer",
                           sport: "Taekwondo",
                           event: "Taekwondo Men's Featherweight")

    OlympianEvent.create(olympian_id: olympian_1.id,
                            event_id: @event_1.id,
                               medal: "Silver")
    OlympianEvent.create(olympian_id: olympian_2.id,
                            event_id: @event_2.id,
                               medal: "Gold")
    OlympianEvent.create(olympian_id: olympian_3.id,
                            event_id: @event_2.id,
                               medal: "NA")
  end

  it 'can hit endpoint successfully' do
    get "/api/v1/events/#{@event_1.id}/medalists"
    expect(response.status).to eq(200)
  end

  it 'returns all medalists as an array with specific data' do
    get "/api/v1/events/#{@event_1.id}/medalists"
    data = JSON.parse(response.body)
    expect(data["event"]).to eq("Diving")
    expect(data["medalists"][0]["name"]).to eq("Maha Abdalsalam Gouda")
  end

  it 'does not return non medalists' do
    get "/api/v1/events/#{@event_2.id}/medalists"
    data = JSON.parse(response.body)
    expect(data["medalists"].length).to eq(1)
  end
end
