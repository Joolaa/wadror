class Brewery < ActiveRecord::Base
    include RatingAverage
    has_many :beers, dependent: :destroy
    has_many :ratings, through: :beers

    validates :name, presence: true
    validates :year, numericality: { greater_than_or_equal_to: 1024,
                                     lesser_than_or_equal_to: Date.tomorrow.year,
                                     only_integer: true }
end
