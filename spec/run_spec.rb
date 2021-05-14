require_relative '../lib/slate_sliders/run'
require 'ruby2d'

RSpec.describe Ruby2D::Window do

  it 'returns class values' do
    expect(Window.current).to be_a(Ruby2D::Window)
    expect(Window.width).to eq(600)
    expect(Window.height).to eq(600)
  end

end