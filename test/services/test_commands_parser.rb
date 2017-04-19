
require_relative '../test_helper'

describe CommandsParser do
  before do
    @command_parser = CommandsParser.new('view map')
  end

  describe '#parse' do
    it 'returns valid command and args' do
      assert_equal('view map', @command_parser.parse)
    end
  end
end
