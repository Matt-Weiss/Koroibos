class EventsSerializer

  def self.all_events
    sports = Event.distinct.pluck(:sport)
    sorted_events = sports.map do |sport|
      {sport: sport,
      events: Event.where(sport: sport).pluck(:event)}
    end
    {events: sorted_events}
  end
end
