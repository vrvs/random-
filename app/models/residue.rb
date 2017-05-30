class Residue < ApplicationRecord
  belongs_to :laboratory
  belongs_to :collection
  has_many :registers, dependent: :destroy
<<<<<<< HEAD
  
  def total
   self.registers.last.weight
  end

  def self.printIT
    "Teste de Controloador"
  end
  
=======
>>>>>>> 4d7117e9d3448c11b14a32ebd182917105e2eb21
end
