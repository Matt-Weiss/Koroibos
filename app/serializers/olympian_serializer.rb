class OlympianSerializer

  def self.parse_olympians(params = nil)
    if params["age"]
      order = :asc
      if params["age"] == 'oldest'
        order = :desc
      end
      olympians = Olympian.includes(:events, :olympian_events).order(age: order).limit(1)
    else
      olympians = Olympian.includes(:events, :olympian_events)
    end

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
