class Register < ApplicationRecord
  belongs_to :department
  belongs_to :laboratory
  belongs_to :residue
  belongs_to :collection
  belongs_to :report
  
  validates :weight, presence: true

end

