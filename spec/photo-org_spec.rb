require_relative '../photo-org.rb'

RSpec.describe PhotoOrg do
  describe "solution" do
    let(:sample) do
      "photo.jpg, Krakow, 2013-09-05 14:08:15
        Mike.png, London, 2015-06-20 15:13:22
        myFriends.png, Krakow, 2013-09-05 14:07:13"
    end
    let(:input) { IO.read("input.txt") }
    let(:p) { PhotoOrg.new }

    it "should return a list the same length as the input" do
      expect(p.solution(sample).count).to eq 3
    end

    it "retains the order of the original list of photos" do
      expect(p.solution(sample)[0]).to match "Krakow"
      expect(p.solution(sample)[1]).to match "London"
    end

    it "should number two photos from the same city sequentially by date" do
      expect(p.solution(sample)[0]).to match "Krakow2"
      expect(p.solution(sample)[2]).to match "Krakow1"
    end

    it "should output the same file extension as the input" do
      expect(p.solution(sample)[0]).to match "jpg"
    end

    it "should format the city number with leading zeros if needed" do
      expect(p.solution(input)[0]).to match "Krakow02"
    end
  end
end
