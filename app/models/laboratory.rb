class Laboratory < ApplicationRecord
  belongs_to :department
  has_many :residues
  validates :name, presence: true


end
