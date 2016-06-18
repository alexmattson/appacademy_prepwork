require "rspec"
require "pieceset"
require "byebug"

describe PieceSet do
  let(:pieces) { PieceSet.new }
    
  describe "#initialize" do
    context "when new ship instnace created" do
      it "sets ships to new Hash" do
        expect(pieces.ships).to be_instance_of(Hash)
      end
    end
  end

end
