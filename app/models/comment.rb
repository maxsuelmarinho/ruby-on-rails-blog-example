class Comment < ApplicationRecord
  belongs_to :article

  before_destroy :can_destroy?
  
  private

  def can_destroy?
    throw(:abort) unless %w(MAX).include? commenter
  end
end
