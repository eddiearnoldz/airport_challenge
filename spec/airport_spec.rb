require 'airport'

describe Airport do
  describe '#land' do
    it { expect(subject).to respond_to(:land).with(1).arguments }
    it "should let a plane land at the airport" do
      plane = Plane.new
      expect(subject.land(plane)).to eq [plane]
    end
    it "should not land a plane if the airport is full" do
      plane = Plane.new
      subject.land(plane)
      plane_two = Plane.new
      expect { subject.land(plane_two) }.to raise_error "Airport is full. Can't land"
    end
  end

  describe '#take_off' do
    it { expect(subject).to respond_to(:take_off).with(1).arguments }
    it "should remove plane from the airport" do
      plane = Plane.new
      subject.land(plane)
      expect(subject.take_off(plane)).to eq "flight #{plane} has taken off from runway 1"
    end
  end
end
