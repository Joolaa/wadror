class User < ActiveRecord::Base
    include RatingAverage

    has_secure_password

    validates :username, uniqueness: true,
                         length: { minimum: 3,
                                   maximum: 15}
    validates :password, length: { minimum: 4},
                         format: { with: /([A-Z].*\d)|(\d.*[A-Z])/,
                                   message: "password must contain at least one number and an uppercase letter" }

    has_many :ratings, dependent: :destroy
    has_many :beers, through: :ratings
    has_many :beer_club, through: :membership
end
