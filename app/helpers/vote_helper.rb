module VoteHelper
  def total_votes(comment_id)
    total = Vote.where(comment_id: comment_id).sum(:vote)
  end
end
