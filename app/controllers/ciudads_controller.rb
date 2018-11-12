class CiudadsController < ApplicationController
  before_action :set_ciudad, only: [:show, :edit, :update, :destroy]
  before_action :set_pai, only: [:new, :create]

  # GET /ciudads
  # GET /ciudads.json
  def index
    @pai = Pai.find(params[:pai_id])
    @ciudads = @pai.ciudads
    @ciudads = Ciudad.search(params[:term])
  end

  # GET /ciudads/1
  # GET /ciudads/1.json
  def show
  end

  # GET /ciudads/new
  def new
    @ciudad = Ciudad.new
  end

  # GET /ciudads/1/edit
  def edit
  end

  # POST /ciudads
  # POST /ciudads.json
  def create
    @ciudad = Ciudad.new(ciudad_params)
    @ciudad.pai_id =  @pai.id

    if @ciudad.save
        redirect_to pai_ciudad_path(@pai, @ciudad)
    end
  end

  # PATCH/PUT /ciudads/1
  # PATCH/PUT /ciudads/1.json
  def update

    respond_to do |format|
      if @ciudad.update(ciudad_params)
        format.html {redirect_to [@pai, @ciudad], notice: 'Ciudad was successfully updated.' }
      else
        format.html { render :edit }
        format.json { render json: @ciudad.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ciudads/1
  # DELETE /ciudads/1.json
  def destroy
    @ciudad.destroy
    respond_to do |format|
      format.html { redirect_to pai_ciudads_path(@ciudad.pai_id), notice: 'Ciudad was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ciudad
      @ciudad = Ciudad.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ciudad_params
      #antes tenia :pai
      params.require(:ciudad).permit(:cid, :nombre, :descripcion, :term)
    end

    def set_pai
      @pai = Pai.find(params[:pai_id])
    end

end
