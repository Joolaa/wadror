require 'rails_helper'

describe "Beer" do
    before :each do
        FactoryGirl.create :beer
    end
    describe "beer is saved properly if" do
        it "is saved if given non-empty name" do
            visit new_beer_path
            fill_in('Name', with:"testi")
            select('Lager', from:"Style")

            expect {
                click_button "Create Beer"
            }.to change{Beer.count}.from(1).to(2)
        end
    end

    describe "beer is not saved if" do
        it "is attempted to be saved with invalid name" do
            visit new_beer_path
            fill_in('Name', with:"")
            select('Lager', from:"Style")

            expect {
                click_button "Create Beer"
            }.to change{Beer.count}.by(0)

            expect(page).to have_content "New Beer"
        end
    end
end
