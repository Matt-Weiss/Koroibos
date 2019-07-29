class Olympian < ApplicationRecord
  validates_presence_of :name

  has_many :olympian_events
  has_many :events, through: :olympian_events
end
