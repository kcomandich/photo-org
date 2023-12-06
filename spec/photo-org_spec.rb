require_relative '../photo-org.rb'

RSpec.describe PhotoOrg do
  describe "solution" do
    let(:sample) { "photo.jpg, Krakow, 2013-09-05 14:08:15\nMike.png, London, 2015-06-20 15:13:22" }
    let(:p)      { PhotoOrg.new }

    it "should return a list the same length as the input" do
      expect(p.solution(sample).count).to eq 2
    end
  end
end
