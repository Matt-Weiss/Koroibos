class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :games
      t.string :sport
      t.string :event

      t.timestamps
    end
  end
end
