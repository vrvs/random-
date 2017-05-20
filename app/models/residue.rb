class Residue < ApplicationRecord
  belongs_to :laboratory
  validates :name, presence: true
end
