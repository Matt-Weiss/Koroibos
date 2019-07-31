class EventsSerializer

  def self.all_events
    sports = Event.distinct.pluck(:sport).sort
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
    {event: event.event,
    medalists: parsed_medalists}
  end

  def self.all_participants
    events = Event.includes(:olympians)
    events.map do |event|
      {event: event.event,
       olympians: event.olympians}
    end
  end
end
