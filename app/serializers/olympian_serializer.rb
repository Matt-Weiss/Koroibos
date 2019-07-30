class OlympianSerializer

  def self.all_olympians
    olympians = Olympian.includes(:events, :olympian_events)
    parsed_olympians = olympians.map do |olympian|
      {name: olympian.name,
       team: olympian.team,
        age: olympian.age,
      sport: olympian.primary_sport(olympian.events),
     total_medals_won: olympian.medal_count(olympian.olympian_events)}
    end
    {olympians: parsed_olympians}
  end

end
