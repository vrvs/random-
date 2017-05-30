class Collection < ApplicationRecord
  has_many :residues
  has_many :registers, dependent: :destroy
end
