require 'spec_helper'
require 'board'

describe Board do
    board = Board.new
    it 'has tiles' do
        expect(board.tiles).to be_an_instance_of(Array)
    end
end