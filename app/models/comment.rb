class Comment < ApplicationRecord
  belongs_to :article

  before_destroy :validate_commenter
  
  private

  def validate_commenter
    allowed_commenter = %w(ADMIN).freeze
    if allowed_commenter.include? commenter
      errors.add(:commenter, "is not allowed remove Admin's comments")
      throw(:abort)
    end
  end
end
