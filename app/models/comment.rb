class Comment < ApplicationRecord
  belongs_to :article

  before_destroy :can_destroy?
  
  private

  def can_destroy?
    throw(:abort) if %w(ADMIN).include? commenter
  end
end
