require_relative '../photo-org.rb'

RSpec.describe PhotoOrg do
  describe "solution" do
    let(:sample) do
      "photo.jpg, Krakow, 2013-09-05 14:08:15
        Mike.png, London, 2015-06-20 15:13:22
        myFriends.png, Krakow, 2013-09-05 14:07:13"
    end
    let(:p) { PhotoOrg.new }

    it "should return a list the same length as the input" do
      expect(p.solution(sample).count).to eq 3
    end

    it "should number two photos from the same city sequentially by date" do
      expect(p.solution(sample)[0]).to eq "Krakow2.jpg"
      expect(p.solution(sample)[2]).to eq "Krakow1.png"
    end
  end
end
