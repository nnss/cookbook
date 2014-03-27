class Term < ActiveRecord::Base
  attr_accessible :definition, :term

  validates :term, presence: true, uniqueness: true


  before_save { |t| t.term = term.downcase }
end
