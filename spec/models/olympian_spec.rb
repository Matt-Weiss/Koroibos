require 'rails_helper'

describe Olympian, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:name)}
  end
  describe 'relationships' do
    it{should have_many :olympian_events}
    it{should have_many :events}
  end

  describe 'instance methods' do
    before :each do
      @olympian_1 = Olympian.create(name: "Maha Abdalsalam Gouda",
                       sex: "F",
                       age: 18,
                    height: 172,
                    weight: 61,
                      team: "Egypt")

      event_1 = Event.create(games: "2016 Summer",
                   sport: "Swimming",
                   event: "Women's 100m Butterfly")
      event_2 = Event.create(games: "2016 Summer",
                   sport: "Diving",
                   event: "Diving Women's Platform")
      event_3 = Event.create(games: "2016 Summer",
                   sport: "Diving",
                   event: "Diving Women's Platform")

      OlympianEvent.create(olympian_id: @olympian_1.id,
                              event_id: event_1.id,
                                 medal: "NA")
      OlympianEvent.create(olympian_id: @olympian_1.id,
                              event_id: event_2.id,
                                 medal: "Gold")
      OlympianEvent.create(olympian_id: @olympian_1.id,
                              event_id: event_3.id,
                                 medal: "Silver")
      @events = [event_1, event_2, event_3]
      @olympian_events = @olympian_1.olympian_events
    end

    it 'primary_sport' do
      expect(@olympian_1.primary_sport(@events)).to eq("Diving")
    end

    it 'medal_count' do
      expect(@olympian_1.medal_count(@olympian_events)).to eq(2)
    end

  end
end
