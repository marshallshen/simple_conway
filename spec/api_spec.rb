require "spec_helper"

describe "Simple Conway API" do
  describe "PUT /next_generation" do
    it "returns 400 when N is not passed" do
      post "/next_generation", "M" => "5", "liveCells" => "[[2,1],[2,2],[2,3]]"
      expect(last_response.status).to eq(400)
      expect(last_response.body).to eq("Height N is required")
    end

    it "returns 400 when N is not passed" do
      post "/next_generation", "N" => "5", "liveCells" => "[[2,1],[2,2],[2,3]]"
      expect(last_response.status).to eq(400)
      expect(last_response.body).to eq("Width M is required")
    end

    it "returns 400 when liveCells is not passed" do
      post "/next_generation", "M" => "5", "N" => "5"
      expect(last_response.status).to eq(400)
      expect(last_response.body).to eq("liveCells is required")
    end

    it "returns 200 and next genaration in JSON" do
      post "/next_generation", "M" => "5", "N" => "5", "liveCells" => "[[2,1],[2,2],[2,3]]"
      expect(last_response.status).to eq(200)
      expect(last_response.body).to eq("[[1,2],[2,2],[3,2]]")
    end
  end
end
