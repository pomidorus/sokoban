require_relative '../test_helper'

describe Wall do
  before do
    @wall = Wall.new
  end

  describe '#draw' do
    it 'returns valid symbol' do
      assert_equal('#', @wall.draw)
    end
  end
end
