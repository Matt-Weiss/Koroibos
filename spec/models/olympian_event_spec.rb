require 'rails_helper'

describe OlympianEvent, type: :model do
  describe 'relationships' do
    it{should belong_to :olympian}
    it{should belong_to :event}
  end
end
