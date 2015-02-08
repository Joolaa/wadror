require 'rails_helper'

describe "Rating" do
    let!(:brewery) { FactoryGirl.create :brewery, name:"Koff" }
    let!(:beer1) { FactoryGirl.create :beer, name:"iso 3", brewery:brewery }
    let!(:beer2) { FactoryGirl.create :beer, name:"Karhu", brewery:brewery }
    let!(:user) { FactoryGirl.create :user }

    

    before :each do
        sign_in(username:"Pekka", password:"Foobar1")
    end

    it "when given, is registered to the beer and user who is signed in" do
        visit new_rating_path
        select('iso 3', from:'rating[beer_id]')
        fill_in('rating[score]', with:'15')

        expect{
            click_button "Create Rating"
        }.to change{Rating.count}.from(0).to(1)

        expect(user.ratings.count).to eq(1)
        expect(beer1.ratings.count).to eq(1)
        expect(beer1.average_rating).to eq(15.0)
    end

    

    describe "ratings pages are correct" do
        before :each do
            visit new_rating_path
            select('iso 3', from:'rating[beer_id]')
            fill_in('rating[score]', with:'15')

            click_button "Create Rating"
        end

        it "when visiting ratings page, the correct ratings are shown" do
            visit ratings_path

            expect(page).to have_content '15'
            expect(page).to have_content '1'
        end

        it "only ratings made by the user are shown on their page" do
            visit user_path(user)

            expect(page).to have_content '15'
        end

        it "rating is removed properly" do
            visit user_path(user)
            click_link('delete')

            expect(user.ratings.count).to eq(0)
        end
    end
end
