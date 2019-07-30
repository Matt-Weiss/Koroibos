require 'rails_helper'

describe 'Olympian stats endpoint' do
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
                                  sex: "F",
                                  age: 13,
                               height: 183,
                               weight: 60,
                                 team: "Romania")
    olympian_4 = Olympian.create(name: "Nstor Abad Sanjun",
                                  sex: "M",
                                  age: 23,
                               height: 167,
                               weight: 64,
                                 team: "Spain")
  end

  it 'can hit endpoint successfully' do
    get '/api/v1/olympian_stats'
    expect(response.status).to eq(200)
  end

  it 'retrieves correct olympian data' do
    get '/api/v1/olympian_stats'
    data = JSON.parse(response.body)
    expect(data["olympian_stats"]["total_competing_olympians"]).to eq(4)
  end

  it 'retrieves correct average age' do
    get '/api/v1/olympian_stats'
    data = JSON.parse(response.body)
    expect(data["olympian_stats"]["average_age"]).to eq(18.5)
  end

  it 'retrieves correct male average weight' do
    get '/api/v1/olympian_stats'
    data = JSON.parse(response.body)
    expect(data["olympian_stats"]["average_weight"]["male_olympians"]).to eq(66)
  end

  it 'retrieves correct female average weight' do
    get '/api/v1/olympian_stats'
    data = JSON.parse(response.body)
    expect(data["olympian_stats"]["average_weight"]["female_olympians"]).to eq(60.5)
  end
end
