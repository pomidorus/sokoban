require_relative '../test_helper'

describe Crate do
  before do
    @crate = Crate.new
  end

  describe '#draw' do
    it 'returns valid symbol' do
      assert_equal('o', @crate.draw)
    end
  end
end
