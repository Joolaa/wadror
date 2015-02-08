require 'rails_helper'

RSpec.describe Beer, type: :model do

    it "has a correct name" do
        beer = Beer.create name:"Koffin sininen", style:"not craft"

        expect(beer).to be_valid
        expect(Beer.count).to eq(1)
    end

    it "is not saved if it misses a name" do
        beer = Beer.create style:"just beer"

        expect(beer).not_to be_valid
        expect(Beer.count).to eq(0)
    end

    it "is not saved if it misses a style" do
        beer = Beer.create name:"ambiguous beer"

        expect(beer).not_to be_valid
        expect(Beer.count).to eq(0)
    end
end
