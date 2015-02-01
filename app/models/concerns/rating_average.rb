module RatingAverage
    extend ActiveSupport::Concern

    def average_rating
        if ratings.count == 0
            return 0
        end
        self.ratings.map{|rating| rating.score}.sum /
            self.ratings.count.to_f
    end
end
