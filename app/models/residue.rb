class Residue < ApplicationRecord
  belongs_to :laboratory
  belongs_to :collection
  has_many :registers, dependent: :destroy
  
  def total
   self.registers.last.weight
  end

  def self.printIT
    "Teste de Controloador"
  end
  
end
