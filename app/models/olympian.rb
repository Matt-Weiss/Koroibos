class Olympian < ApplicationRecord
  validates_presence_of :name

  has_many :olympian_events
  has_many :events, through: :olympian_events

  def primary_sport(events)
    sports = Hash.new(0)
    events.each do |event|
      sports[event.sport] +=1
    end
    primary_sport = sports.max_by do |key, value|
      value
    end
    primary_sport[0]
  end

  def medal_count(olympian_events)
    medal_count = 0
    olympian_events.each do |event|
      if event.medal != "NA"
        medal_count +=1
      end
    end
    medal_count
  end
end
