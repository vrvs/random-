class Residue < ApplicationRecord
  belongs_to :laboratory
  has_many :registers, dependent: :destroy
  
  validates :type, inclusion: {in: %w(Solido\ Organico Solido\ Inorganico Liquido\ Organico Liquido\ Inorganico Liquido\ Inflamavel Outros)}
end
