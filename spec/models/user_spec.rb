require 'rails_helper'

describe User do
    it "has the username set correctly" do
        user = User.new username:"Pekka"

        user.username.should == "Pekka"
    end

    it "is not saved without a password" do
        user = User.create username:"Pekka"

        expect(user).not_to be_valid
        expect(User.count).to eq(0)
    end

    it "is not saved if password is too short" do
        user = User.create username:"Pekka", password:"As9", password_confirmation:"As9"

        expect(user).not_to be_valid
        expect(User.count).to eq(0)
    end
    it "is not saved if password does not contain numerals" do
        user = User.create username:"Pekka", password:"sdlkfjldsjfslk", password_confirmation:"sdlkfjldsjfslk"

        expect(user).not_to be_valid
        expect(User.count).to eq(0)
    end

    describe "with a proper password" do
        let(:user){ FactoryGirl.create(:user) }

        it "is saved" do
            expect(user).to be_valid
            expect(User.count).to eq(1)
        end

        it "and with two ratings, has the correct average rating" do
            user.ratings << FactoryGirl.create(:rating)
            user.ratings << FactoryGirl.create(:rating2)

            expect(user.ratings.count).to eq(2)
            expect(user.average_rating).to eq(15.0)
        end
    end
end
