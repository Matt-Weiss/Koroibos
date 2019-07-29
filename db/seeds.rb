require 'csv'

csv_text = File.read('./app/data/olympic_data.csv')
csv = CSV.parse(csv_text, :headers => true)
csv.each do |row|
  row_hash = row.to_hash
  olympian = Olympian.find_or_create_by(name: row_hash["Name"],
                                         age: row_hash["Age"],
                                         sex: row_hash["Sex"],
                                      height: row_hash["Height"],
                                      weight: row_hash["Weight"],
                                        team: row_hash["Team"])

  event = Event.find_or_create_by(games: row_hash["Games"],
                                  sport: row_hash["Sport"],
                                  event: row_hash["Event"])

  OlympianEvent.create(olympian_id: olympian.id,
                          event_id: event.id,
                             medal: row_hash["Medal"])
end
