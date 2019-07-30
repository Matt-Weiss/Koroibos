class EventsSerializer

  def self.all_events
    sports = Event.distinct.pluck(:sport)
    sorted_events = sports.map do |sport|
      {sport: sport,
      events: Event.where(sport: sport).pluck(:event)}
    end
    {events: sorted_events}
  end

  def self.medalists(event_id)
    event = Event.find(event_id)
    medalists = event.olympians.select(:name, :team, :age, 'olympian_events.medal as medal').where('olympian_events.medal != ?', 'NA')
    parsed_medalists = medalists.map do |medalist|
      {name: medalist.name,
       team: medalist.team,
        age: medalist.age,
      medal: medalist.medal}
    end
    {event: event.sport,
    medalists: parsed_medalists}
  end
end
