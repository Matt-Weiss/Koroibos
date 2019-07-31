require 'rails_helper'

describe 'Team medals endpoint' do
  before :each do
    olympian_1 = Olympian.create(name: "Maha Abdalsalam Gouda",
                                  sex: "F",
                                  age: 18,
                               height: 172,
                               weight: 61,
                                 team: "Egypt")
    event_1 = Event.create(games: "2016 Summer",
                           sport: "Diving",
                           event: "Diving Women's Platform")
    OlympianEvent.create(olympian_id: olympian_1.id,
                            event_id: event_1.id,
                               medal: "NA")

    olympian_2 = Olympian.create(name: "Ahmad Abughaush",
                                  sex: "M",
                                  age: 20,
                               height: 178,
                               weight: 68,
                                 team: "Jordan")
    event_2 = Event.create(games: "2016 Summer",
                           sport: "Taekwondo",
                           event: "Taekwondo Men's Featherweight")
    OlympianEvent.create(olympian_id: olympian_2.id,
                            event_id: event_2.id,
                               medal: "Gold")
    olympian_3 = Olympian.create(name: "Ana Iulia Dascl",
                                  sex: "F",
                                  age: 13,
                               height: 183,
                               weight: 60,
                                 team: "Romania")
    event_3 = Event.create(games: "2016 Summer",
                           sport: "Swimming",
                           event: "Swimming Women's 100 metres Freestyle")
    OlympianEvent.create(olympian_id: olympian_3.id,
                            event_id: event_3.id,
                               medal: "NA")
  end

  it 'can hit endpoint successfully' do
    get '/api/v1/team_medals'
    expect(response.status).to eq(200)
  end

  it 'retrieves correct olympian data' do
    get '/api/v1/team_medals'
    data = JSON.parse(response.body)
    expect(data["team_medals"]["Jordan"]).to eq(1)
  end
end
