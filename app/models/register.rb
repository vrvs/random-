class Register < ApplicationRecord
  belongs_to :department
  belongs_to :laboratory
  belongs_to :residue
  belongs_to :collection
  
  validates :weight, presence: true
end
