module VotesHelper
  def total_votes(comment_id)
    total = Vote.where(comment_id: comment_id).sum(:vote)
  end

  def voted_on(user_id, comment_id)
    @vote = Vote.find_by(user_id: user_id, comment_id: comment_id)
      if @vote != nil
        return true
      end
    false
  end
end
