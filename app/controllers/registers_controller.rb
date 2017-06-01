class RegistersController < ApplicationController
  before_action :set_register, only: [:show, :edit, :update, :destroy]

  # GET /registers
  # GET /registers.json
  def index
    @registers = Register.all
  end

  # GET /registers/1
  # GET /registers/1.json
  def show
  end

  # GET /registers/new
  def new
    @register = Register.new
  end

  # GET /registers/1/edit
  def edit
  end

  # POST /registers
  # POST /registers.json
  def create
    @register = Register.new(register_params)

    respond_to do |format|
      if @register.save
        format.html { redirect_to @register, notice: 'Register was successfully created.' }
        format.json { render :show, status: :created, location: @register }
      else
        format.html { render :new }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /registers/1
  # PATCH/PUT /registers/1.json
  def update
    respond_to do |format|
      if @register.update(register_params)
        format.html { redirect_to @register, notice: 'Register was successfully updated.' }
        format.json { render :show, status: :ok, location: @register }
      else
        format.html { render :edit }
        format.json { render json: @register.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /registers/1
  # DELETE /registers/1.json
  def destroy
    @register.destroy
    respond_to do |format|
      format.html { redirect_to registers_url, notice: 'Register was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  # POST /update_weight
  def update_weight
    if register_params[:residue_id] != nil then
      res = Residue.find(register_params[:residue_id])
      reg = update_date(res)
      res.registers.create(weight: reg.weight + register_params[:weight].to_f())
    end
    if register_params[:laboratory_id] != nil then
      lab = Laboratory.find(register_params[:laboratory_id])
      reg = update_date(lab)
      lab.registers.create(weight: reg.weight + register_params[:weight].to_f())
    end
    if register_params[:department_id] != nil then
      dep = Department.find(register_params[:department_id])
      reg = update_date(dep)
      dep.registers.create(weight: reg.weight + register_params[:weight].to_f())
    end
    if register_params[:collection_id] != nil then
      col = Collection.find(register_params[:collection_id])
      reg = update_date(col)
      col.registers.create(weight: reg.weight + register_params[:weight].to_f())
    end
  end
  
  def update_date(obj)
    reg = obj.registers.last
    reg.updated_at = Time.now
    reg.save
    reg
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_register
      @register = Register.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def register_params
      params.require(:register).permit(:weight, :department_id, :laboratory_id, :residue_id, :collection_id, :report_id)
    end
end
