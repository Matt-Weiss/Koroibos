require 'rails_helper'

describe Event, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:games)}
  end
  describe 'relationships' do
    it{should have_many :olympian_events}
    it{should have_many :olympians}
  end
end
