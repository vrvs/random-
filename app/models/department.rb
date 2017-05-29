class Department < ApplicationRecord
  has_many :laboratories, dependent: :destroy
  has_many :residues, through: :laboratories, dependent: :destroy
  has_many :registers, dependent: :destroy
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
