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

  it "5 by 5 by grid: returns next generation of live cells" do
    expect(SimpleConway.next_generation(5, 5, [[2,1],[2,2],[2,3]])).to eql([[1,2],[2,2],[3,2]])
    expect(SimpleConway.next_generation(5, 5, [[1,2],[2,2],[3,2]])).to eql([[2,1],[2,2],[2,3]])
  end

  it "19 by 20 by grid: returns next generation of live cells" do
    expect(SimpleConway.next_generation(19, 20, [[2,1],[2,2],[2,3]])).to eql([[1,2],[2,2],[3,2]])
    expect(SimpleConway.next_generation(19, 20, [[1,2],[2,2],[3,2]])).to eql([[2,1],[2,2],[2,3]])
  end

  it "1000 by 1000 returns next generation of live cells" do
    expect(SimpleConway.next_generation(1000, 1000, [[2,1],[2,2],[2,3]])).to eql([[1,2],[2,2],[3,2]])
    expect(SimpleConway.next_generation(1000, 1000, [[1,2],[2,2],[3,2]])).to eql([[2,1],[2,2],[2,3]])
  end
end
