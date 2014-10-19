require "spec_helper"

describe "Simple Conway API" do
  describe "GET /next_generation" do
    it "returns 400 when N is not passed" do
      get "/next_generation", {"callback"=>"jQuery123", "M"=>"5", "liveCells"=>{"0"=>["2", "1"], "1"=>["2", "2"], "2"=>["2", "3"]}}
      expect(last_response.body).to eq("Height N is required")
    end

    it "returns 400 when N is not passed" do
      get "/next_generation", {"callback"=>"jQuery123", "N"=>"5", "liveCells"=>{"0"=>["2", "1"], "1"=>["2", "2"], "2"=>["2", "3"]}}
      expect(last_response.status).to eq(400)
      expect(last_response.body).to eq("Width M is required")
    end

    it "returns 400 when liveCells is not passed" do
      get "/next_generation", {"callback"=>"jQuery123", "M"=>"5", "N"=>"5"}
      expect(last_response.status).to eq(400)
      expect(last_response.body).to eq("liveCells is required")
    end

    it "returns 400 if it is not jQuery callback" do
      get "/next_generation", {"M"=>"5", "N"=>"5", "liveCells"=>{"0"=>["2", "1"], "1"=>["2", "2"], "2"=>["2", "3"]}}
      expect(last_response.status).to eq(400)
      expect(last_response.body).to eq("jQuery callback is required")
    end

    it "returns 200 and next genaration in JSONP" do
      get "/next_generation", {"callback"=>"jQuery123", "M"=>"5", "N"=>"5", "liveCells"=>{"0"=>["2", "1"], "1"=>["2", "2"], "2"=>["2", "3"]}}
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq("jQuery123([[1,2],[2,2],[3,2]])")
    end

    it "performance: scales with large grid", performance: true do
      x, y = 10_000, 10_000
      live_cells = Hash.new.tap{|h| Array(1..100).each {|i| h[i.to_s] =  [rand(x).to_s, rand(y).to_s]}}
      get "/next_generation", {"callback"=>"jQuery123", "M"=>"5", "N"=>"5", "liveCells"=>live_cells}
      expect(last_response.status).to eq(200)
    end
  end
end
