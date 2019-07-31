class TeamsSerializer

  def self.medal_count
    team_medals = Olympian.joins(:olympian_events).group(:team).where('olympian_events.medal != ?', 'NA').count(:id)
    sorted_teams = team_medals.sort_by do |key, value|
      value
    end
    {team_medals: sorted_teams.reverse.to_h}
  end

end
