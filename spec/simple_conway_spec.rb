require "spec_helper"

describe SimpleConway do
  it "returns empty array if any live cell is out of boundary" do
    expect(SimpleConway.next_generation(1, 1, [[2,1],[2,2],[2,3]])).to be_empty
  end

  it "returns empty array if any live cell has negative position" do
    expect(SimpleConway.next_generation(3, 3, [[2,-1],[2,2],[2,3]])).to be_empty
  end

  it "3 by 3 grid: returns next generation of live cells" do
    expect(SimpleConway.next_generation(3, 3, [[2,1],[2,2],[2,3]])).to eql([[1,2],[2,2],[3,2]])
    expect(SimpleConway.next_generation(3, 3, [[1,2],[2,2],[3,2]])).to eql([[2,1],[2,2],[2,3]])
  end

  it "19 by 20 by grid: returns next generation of live cells" do
    expect(SimpleConway.next_generation(19, 20, [[2,1],[2,2],[2,3]])).to eql([[1,2],[2,2],[3,2]])
    expect(SimpleConway.next_generation(19, 20, [[1,2],[2,2],[3,2]])).to eql([[2,1],[2,2],[2,3]])
  end

  it "1000 by 1000 grid: returns next generation of live cells" do
    expect(SimpleConway.next_generation(1000, 1000, [[2,1],[2,2],[2,3]])).to eql([[1,2],[2,2],[3,2]])
    expect(SimpleConway.next_generation(1000, 1000, [[1,2],[2,2],[3,2]])).to eql([[2,1],[2,2],[2,3]])
  end

  it "large-scale grid: algorithm scales with board size", performance: true do
    x, y = 10_000, 10_000
    ten_live_cells = Array.new.tap{|cells| 10.times {cells << [rand(x), rand(y)]}}
    hundred_live_cells = Array.new.tap{|cells| 100.times {cells << [rand(x), rand(y)]}}

    time_of_ten = Benchmark.realtime{SimpleConway.next_generation(x, y, ten_live_cells)}
    time_of_hundred = Benchmark.realtime{SimpleConway.next_generation(x, y, hundred_live_cells)}

    expect(time_of_hundred).to be <= (100 * time_of_ten)
  end
end
