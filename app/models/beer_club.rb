class BeerClub < ActiveRecord::Base
    has_many :members, -> { uniq }, through: :membership, source: :user
end
