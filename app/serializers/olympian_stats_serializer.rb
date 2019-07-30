class OlympianStatsSerializer

  def self.all_olympians
    olympians = Olympian.all

    weights = {unit: "kg",
      male_olympians: olympians.where(sex: "M").where("weight != 0").average(:weight).to_f.round(2),
      female_olympians: olympians.where(sex: "F").where("weight != 0").average(:weight).to_f.round(2)}

    parsed_stats = {total_competing_olympians: olympians.count,
                               average_weight: weights,
                                  average_age: olympians.where("age != 0").average(:age).to_f.round(2)}

    {olympian_stats: parsed_stats}
  end
end
