require_relative '../test_helper'

describe Man do
  before do
    @man = Man.new
  end

  describe '#draw' do
    it 'returns valid symbol' do
      assert_equal('@', @man.draw)
    end
  end
end
