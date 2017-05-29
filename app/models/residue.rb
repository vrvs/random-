class Residue < ApplicationRecord
  belongs_to :laboratory
  validates :name, presence: true

  def self.total
    self.sum(:weight)
  end
  has_many :registers, dependent: :destroy

end
