require_relative '../test_helper'

describe OpenFloor do
  before do
    @open_floor = OpenFloor.new
  end

  describe '#draw' do
    it 'returns valid symbol' do
      assert_equal(' ', @open_floor.draw)
    end
  end
end
