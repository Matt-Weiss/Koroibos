require 'rails_helper'

describe Olympian, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:name)}
  end
  describe 'relationships' do
    it{should have_many :olympian_events}
    it{should have_many :events}
  end
end
