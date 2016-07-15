module RatingsHelper
  def find_average_rating(game)
    total = 0
    length = 0
    game.ratings.each do |rating|
      next if rating.rating == nil
      total += rating.rating
      length +=1
    end
    
    if length > 0
      return (total/length).to_f
    else
      return "No Rating"
    end

  end
end
