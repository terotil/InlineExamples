require 'inline_examples'

class Bowling
  extend InlineExamples

  for_example "returns 0 for all gutter game" do
    bowling = Bowling.new
    20.times { bowling.hit(0) }
    bowling.score.should == 0
  end

  # Record hits
  def hit(pins)
  end

  # Current score of the game
  def score
    0
  end
end
