require_relative '../test_helper'

describe Storage do
  before do
    @storage = Storage.new
  end

  describe '#draw' do
    it 'returns valid symbol' do
      assert_equal('.', @storage.draw)
    end
  end
end
