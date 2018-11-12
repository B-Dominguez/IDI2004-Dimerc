class PaisController < ApplicationController
  before_action :set_pai, only: [:show, :edit, :update, :destroy]

  # GET /pais
  # GET /pais.json
  def index
    @pais = Pai.search(params[:term])
  end

  # GET /pais/1
  # GET /pais/1.json
  def show
  end

  # GET /pais/new
  def new
    @pai = Pai.new
  end

  # GET /pais/1/edit
  def edit
  end

  def pais_params
    params.require(:pais).permit(:name, :complete, :due_date, :term)
  end

  # POST /pais
  # POST /pais.json
  def create
    @pai = Pai.new(pai_params)

    respond_to do |format|
      if @pai.save
        format.html { redirect_to @pai, notice: 'Pai was successfully created.' }
        format.json { render :show, status: :created, location: @pai }
      else
        format.html { render :new }
        format.json { render json: @pai.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pais/1
  # PATCH/PUT /pais/1.json
  def update
    respond_to do |format|
      if @pai.update(pai_params)
        format.html { redirect_to @pai, notice: 'Pai was successfully updated.' }
        format.json { render :show, status: :ok, location: @pai }
      else
        format.html { render :edit }
        format.json { render json: @pai.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pais/1
  # DELETE /pais/1.json
  def destroy
    @pai.destroy
    respond_to do |format|
      format.html { redirect_to pais_url, notice: 'Pai was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def create_ciudad
    # redirect_to url_for(:controller => :ciudads_controller, :action => :create)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pai
      @pai = Pai.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pai_params
      params.require(:pai).permit(:nombre, :descripcion, :suscriptores, :ubicacion)
    end
end
