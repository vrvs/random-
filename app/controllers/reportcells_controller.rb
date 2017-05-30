class ReportcellsController < ApplicationController
  before_action :set_reportcell, only: [:show, :edit, :update, :destroy]

  # GET /reportcells
  # GET /reportcells.json
  def index
    @reportcells = Reportcell.all
  end

  # GET /reportcells/1
  # GET /reportcells/1.json
  def show
  end

  # GET /reportcells/new
  def new
    @reportcell = Reportcell.new
  end

  # GET /reportcells/1/edit
  def edit
  end

  # POST /reportcells
  # POST /reportcells.json
  def create
    @reportcell = Reportcell.new(reportcell_params)

    respond_to do |format|
      if @reportcell.save
        format.html { redirect_to @reportcell, notice: 'Reportcell was successfully created.' }
        format.json { render :show, status: :created, location: @reportcell }
      else
        format.html { render :new }
        format.json { render json: @reportcell.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reportcells/1
  # PATCH/PUT /reportcells/1.json
  def update
    respond_to do |format|
      if @reportcell.update(reportcell_params)
        format.html { redirect_to @reportcell, notice: 'Reportcell was successfully updated.' }
        format.json { render :show, status: :ok, location: @reportcell }
      else
        format.html { render :edit }
        format.json { render json: @reportcell.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reportcells/1
  # DELETE /reportcells/1.json
  def destroy
    @reportcell.destroy
    respond_to do |format|
      format.html { redirect_to reportcells_url, notice: 'Reportcell was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  #POST '/generate_reportcell'
  def generate_reportcell
    rep = Report.all.last
    case rep.generate_for
    when 0
      col = Collection.find(rep.collection_id)
      res_order = col.residues.where(created_at: [rep.begin_date..rep.end_date]).order(:name)
      res_order.each do |it|
        reg_order = it.registers.where(created_at: [rep.begin_date..rep.end_date]).order(:created_at)
        rep.registers.create(weight: rep.registers.last.weight + reg_order.last.weight)
        
        repc = Reportcell.find_by(res_name: it.name)
        if repc == nil then
          repc = Reportcell.create(res_name: it.name, total: 0, report_id: rep.id)
        end
        add_constraint(rep, repc, it)
      end
    when 1
      dep = Department.find_by(name: reportcell_params[:dep_name])
      lab_order = dep.laboratories.where(created_at: [rep.begin_date..rep.end_date]).order(:name)
      lab_order.each do |l|
        res_order = l.residues.where(created_at: [rep.begin_date..rep.end_date]).order(:name)
        res_order.each do |it|
          reg_order = it.registers.where(created_at: [rep.begin_date..rep.end_date]).order(:created_at)
          rep.registers.create(weight: rep.registers.last.weight + reg_order.last.weight)
        
          repc = Reportcell.find_by(res_name: it.name, dep_name: dep.name)
          if repc == nil then
            repc = Reportcell.create(res_name: it.name, dep_name: dep.name, total: 0, report_id: rep.id)
          end
          add_constraint(rep, repc, it)
        end
      end
    when 2
      lab = Laboratory.find_by(name: reportcell_params[:lab_name])
      res_order = lab.residues.where(created_at: [rep.begin_date..rep.end_date]).order(:name)
      res_order.each do |it|
        reg_order = it.registers.where(created_at: [rep.begin_date..rep.end_date]).order(:created_at)
        rep.registers.create(weight: rep.registers.last.weight + reg_order.last.weight)
      
        repc = Reportcell.find_by(res_name: it.name, lab_name: lab.name)
        if repc == nil then
          repc = Reportcell.create(res_name: it.name, lab_name: lab.name, total: 0, report_id: rep.id)
        end
        add_constraint(rep, repc, it)
      end
    when 3
      puts 'Relatorios por residues'
    end
  end
  
  def add_constraint(rep, repc, res)
    if rep.f_blend then
      repc.blend = res.blend
      repc.save
    end
    if rep.f_code then
      repc.code = res.code
      repc.save
    end
    if rep.f_kind then
      repc.kind = res.kind
      repc.save
    end
    if rep.f_onu then
      repc.onu = res.onu
      repc.save
    end
    if rep.f_state then
      repc.state = res.state
      repc.save
    end
    if rep.f_total then
      repc.total = repc.total + res.registers.last.weight
      repc.save
    end
    if rep.f_unit then
      repc.unit = res.unit
      repc.save
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reportcell
      @reportcell = Reportcell.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reportcell_params
      params.require(:reportcell).permit(:dep_name, :lab_name, :res_name, :kind, :total, :onu, :state, :blend, :code, :unit, :report_id)
    end
end
