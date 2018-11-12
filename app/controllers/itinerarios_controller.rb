class ItinerariosController < ApplicationController
  before_action :set_itinerario, only: [:show, :edit, :update, :destroy]

  # GET /itinerarios
  # GET /itinerarios.json
  def index
    @itinerarios = Itinerario.search(params[:term])
  end

  # GET /itinerarios/1
  # GET /itinerarios/1.json
  def show
  end

  # GET /itinerarios/new
  def new
    @itinerario = Itinerario.new
  end

  # GET /itinerarios/1/edit
  def edit
  end

  # POST /itinerarios
  # POST /itinerarios.json
  def create
    @itinerario = Itinerario.new(itinerario_params)

    respond_to do |format|
      if @itinerario.save
        format.html { redirect_to @itinerario, notice: 'Itinerario was successfully created.' }
        format.json { render :show, status: :created, location: @itinerario }
      else
        format.html { render :new }
        format.json { render json: @itinerario.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /itinerarios/1
  # PATCH/PUT /itinerarios/1.json
  def update
    respond_to do |format|
      if @itinerario.update(itinerario_params)
        format.html { redirect_to @itinerario, notice: 'Itinerario was successfully updated.' }
        format.json { render :show, status: :ok, location: @itinerario }
      else
        format.html { render :edit }
        format.json { render json: @itinerario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /itinerarios/1
  # DELETE /itinerarios/1.json
  def destroy
    @itinerario.destroy
    respond_to do |format|
      format.html { redirect_to itinerarios_url, notice: 'Itinerario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_itinerario
      @itinerario = Itinerario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def itinerario_params
      params.require(:itinerario).permit(:nombre, :descripcion, :duracion, :lugares, :actividades, :term)
    end
end
