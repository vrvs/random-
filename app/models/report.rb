class Report < ApplicationRecord
  belongs_to :collection
  has_many :reportcells, dependent: :destroy
  has_many :registers, dependent: :destroy
end
