class Department < ApplicationRecord
  has_many :laboratories, dependent: :destroy
  has_many :registers, dependents: :destroy
  validates :name, presence: true, uniqueness: {case_sensitive: false}
end
