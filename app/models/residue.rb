class Residue < ApplicationRecord
  belongs_to :laboratory
<<<<<<< HEAD
  validates :name, presence: true

  def self.total
    self.sum(:weight)
  end
=======
  has_many :registers, dependent: :destroy
  
  validates :type, inclusion: {in: %w(Solido\ Organico Solido\ Inorganico Liquido\ Organico Liquido\ Inorganico Liquido\ Inflamavel Outros)}
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
end
