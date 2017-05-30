class Residue < ApplicationRecord
  belongs_to :laboratory
  belongs_to :collection
  has_many :registers, dependent: :destroy
  
<<<<<<< HEAD
  def total
   self.registers.last.weight
  end

=======
  def self.printIT
    "Teste de Controloador"
  end
  
>>>>>>> af5b3b9242e88e331d155c5c223b23ca30848ae0
end
