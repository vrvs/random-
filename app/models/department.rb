class Department < ApplicationRecord
  has_many :laboratories, dependent: :destroy
<<<<<<< HEAD
  validates :name, presence: true

=======
  has_many :residues, through: :laboratories, dependent: :destroy
  has_many :registers, dependent: :destroy
  validates :name, presence: true, uniqueness: {case_sensitive: false}
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
end
