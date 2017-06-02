class Residue < ApplicationRecord
  belongs_to :laboratory
  belongs_to :collection
  has_many :registers, dependent: :destroy
  attr_accessor :mean, :miss_days, :miss_weight, :solido_organico, :solido_inorganico, :liquido_organico, :liquido_inorganico, :liquido_inflamavel, :outros
  
  
  def generate_prediction
    @collection = Collection.last
    weight =  @collection.registers.last.weight
    time = Date.today - @collection.created_at.to_date
    mean = weight/time
    weight = @collection.registers.last.weight
    miss_weight = (@collection.max_value - weight)
    miss_days = miss_weight/mean
    miss_days = miss_days.ceil
    @mean=mean
    @miss_days=miss_days
    @miss_weight=miss_weight
  end
  
  def type_residue
    @solido_organico = 0.0
    @solido_inorganico = 0.0
    @liquido_organico = 0.0
    @liquido_inorganico = 0.0
    @liquido_inflamavel = 0.0
    @outros  = 0.0
    Residue.all.each do |it|
      case it.kind
      when "Sólido Orgânico"
        @solido_organico += it.registers.last.weight
      when "Sólido Inorgânico"
        @csolido_inorganico += it.registers.last.weight
      when "Líquido Orgânico"
        @liquido_organico += it.registers.last.weight
      when "Líquido Inorgânico"
        @liquido_inorganico += it.registers.last.weight
      when "Líquido Inflamável"
        @liquido_inflamavel += it.registers.last.weight
      when "Outros"
        @outros += it.registers.last.weight
      end
      @collection.save
    end
  end
  
end
