module RatingAverage
    extend ActiveSupport::Concern

    def average_rating
        self.ratings.map{|rating| rating.score + 0.0}.sum /
            self.ratings.count
    end
end
