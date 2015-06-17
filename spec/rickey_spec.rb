require "spec_helper"

describe Rickey do
  it "has a version number" do
    expect(Rickey::VERSION).not_to be_nil
  end

  describe "#fetch" do
    it "returns an array containing all the transactions on the specified date" do
      rickey = described_class.new(date: Date.new(2015, 6, 1))

      results = rickey.fetch

      expect(results.count).to eq(29)
    end

    it "can fetch for sport codes other than MLB" do
      rickey =
        described_class.new(date: Date.new(2015, 6, 1), sport_code: "aaa")

      results = rickey.fetch

      expect(results.count).to eq(37)
    end

    it "can filter for transations for a given team" do
      rickey =
        described_class.new(date: Date.new(2015, 6, 5), team_id: 138)

      results = rickey.fetch

      expect(results.count).to eq(2)
    end
  end
end
