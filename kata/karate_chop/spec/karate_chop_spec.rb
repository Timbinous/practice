require_relative '../lib/karate_chop.rb'
describe KarateChop do
  let(:ary)              { [2,4,5,6,9] }

  describe ".middle_number" do
    it "finds the number in the middle of the array" do
      KarateChop.middle_number(ary).should == 5
    end
  end

  describe ".lower_half" do
    it "returns the lower half of an array" do
      KarateChop.lower_half(ary).should == [2,4]
    end
  end

  describe ".upper_half" do
    it "returns the upper half of an array" do
      KarateChop.upper_half(ary).should == [6,9]
    end
  end

  describe ".narrow_down_position" do
    context "when the number we are searching for is less than the middle number" do
      it "returns 0 representing the length of what was subtracted and the lower half of the array" do
        KarateChop.narrow_down_position(4, ary).should == [0,[2,4]]
      end
    end

    context "when the number we are searching for is the middle number" do
      it "returns 2 representing the location and the index of that number" do
        KarateChop.narrow_down_position(5, ary).should == [2,2]
      end
    end

    context "when the number we are searching for is greater than the middle number" do
      it "returns 3 representing the length of what was subtracted the upper half of the array" do
        KarateChop.narrow_down_position(6, ary).should == [3,[6,9]]
      end
    end
  end

  describe ".chop" do
    it 'returns nil for the number 1' do
      KarateChop.chop(1, ary).should be_nil
    end

    it 'returns the position of the number 2' do
      KarateChop.chop(2, ary).should == 0
    end

    it 'returns nil for the number 3' do
      KarateChop.chop(3, ary).should be_nil
    end

    it 'returns the position of the number 4' do
      KarateChop.chop(4, ary).should == 1
    end

    it 'returns the position of the number 5' do
      KarateChop.chop(5, ary).should == 2
    end

    it 'returns the position of the number 6' do
      KarateChop.chop(6, ary).should == 3
    end

    it 'returns nil for the number 7' do
      KarateChop.chop(7, ary).should be_nil
    end

    it 'returns nil for the number 8' do
      KarateChop.chop(8, ary).should be_nil
    end

    it 'returns the position of the number 9' do
      KarateChop.chop(9, ary).should == 4
    end


    it 'returns nil for the number 10' do
      KarateChop.chop(10, ary).should be_nil
    end
  end
end
