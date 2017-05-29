class Collection < ApplicationRecord
  has_many :residues
  has_many :registers, dependent: :destroy
  
  validates :max_value, presence: true
end
