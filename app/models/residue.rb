class Residue < ApplicationRecord
  belongs_to :laboratory
  has_many :registers, dependent: :destroy
end
