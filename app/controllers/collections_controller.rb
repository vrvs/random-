class CollectionsController < ApplicationController
  before_action :set_collection, only: [:show, :edit, :update, :destroy]
  
  # GET /collections
  # GET /collections.json
  def index
    @collections = Collection.all
  end

  # GET /collections/1
  # GET /collections/1.json
  def show
  end

  # GET /collections/new
  def new
    @collection = Collection.new
  end

  # GET /collections/1/edit
  def edit
  end

  # POST /collections
  # POST /collections.json

  def create
    @collection = Collection.new(collection_params)
    respond_to do |format|
      if @collection.save
        format.html { redirect_to @collection, notice: 'Collection was successfully created.' }
        format.json { render :show, status: :created, location: @collection }
        @collection.registers.create(weight:0)
        @collection.save
      else
        format.html { render :new }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /collections/1
  # PATCH/PUT /collections/1.json
  def update
    respond_to do |format|
      if @collection.update(collection_params)
        format.html { redirect_to @collection, notice: 'Collection was successfully updated.' }
        format.json { render :show, status: :ok, location: @collection }
      else
        format.html { render :edit }
        format.json { render json: @collection.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /collections/1
  # DELETE /collections/1.json
  def destroy
    @collection.destroy
    respond_to do |format|
      format.html { redirect_to collections_url, notice: 'Collection was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # POST /generate_notification
  def generate_notification
  end
  
  # POST /generate_prediction
  def generate_prediction
    @collection = Collection.last
    weight =  @collection.registers.last.weight
    time = Date.today - @collection.created_at.to_date
    mean = weight/time
    weight = @collection.registers.last.weight
    miss_weight = (@collection.max_value - weight)
    miss_days = miss_weight/mean
    miss_days = miss_days.ceil
    @collection.mean=mean
    @collection.miss_days=miss_days
    @collection.miss_weight=miss_weight
    @collection.save
  end
  
  def type_residue
    @collection = Collection.last
    @collection.solido_organico = 0.0
    @collection.solido_inorganico = 0.0
    @collection.liquido_organico = 0.0
    @collection.liquido_inorganico = 0.0
    @collection.liquido_inflamavel = 0.0
    @collection.outros  = 0.0
    Residue.all.each do |it|
      case it.kind
      when "Sólido Orgânico"
        @collection.solido_organico += it.registers.last.weight
      when "Sólido Inorgânico"
        @collection.solido_inorganico += it.registers.last.weight
      when "Líquido Orgânico"
        @collection.liquido_organico += it.registers.last.weight
      when "Líquido Inorgânico"
        @collection.liquido_inorganico += it.registers.last.weight
      when "Líquido Inflamável"
        @collection.liquido_inflamavel += it.registers.last.weight
      when "Outros"
        @collection.outros += it.registers.last.weight
      end
      @collection.save
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collection
      @collection = Collection.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collection_params
      params.require(:collection).permit(:max_value, :report)
    end
end
