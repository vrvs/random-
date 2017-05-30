class Register < ApplicationRecord
  belongs_to :department
  belongs_to :laboratory
  belongs_to :residue
  belongs_to :collection
<<<<<<< HEAD
=======
  belongs_to :report
  
>>>>>>> f5d840c594f41251db69b48ceb5f1275a5ca7d21
  validates :weight, presence: true

end

