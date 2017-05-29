class Laboratory < ApplicationRecord
  belongs_to :department
<<<<<<< HEAD
  has_many :residues
  validates :name, presence: true


=======
  belongs_to :user
  has_many :residues, dependent: :destroy
  has_many :registers, dependent: :destroy
  has_one :request, dependent: :destroy
  
  validates :name, presence: true, uniqueness: {case_sensitive: false}
>>>>>>> 3eabae6d504822de73998139fda6ae708c23e5d8
end
