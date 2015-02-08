require 'rails_helper'

RSpec.describe BeerClub, type: :model do
    it "is possible to create" do
        BeerClubsController
        Membership
        MembershipsController
        expect {
            BeerClub.create name:"akateeminen kerho"
        }.to change{BeerClub.count}.by(1)
    end
end
