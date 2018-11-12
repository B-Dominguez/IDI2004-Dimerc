class PublicacionsController < ApplicationController
  before_action :set_publicacion, only: [:show, :edit, :update, :destroy]
  before_action :set_ciudad, only: [:new, :create]

  # GET /publicacions
  # GET /publicacions.json
  def index
    @ciudad = Ciudad.find(params[:ciudad_id])
    @publicacions = @ciudad.publicacions
    @publicacions = Publicacion.search(params[:term])
  end

  # GET /publicacions/1
  # GET /publicacions/1.json
  def show
  end

  # GET /publicacions/new
  def new
    @publicacion = Publicacion.new
  end

  # GET /publicacions/1/edit
  def edit
  end

  # POST /publicacions
  # POST /publicacions.json
  def create
    @publicacion = Publicacion.new(publicacion_params)
    @publicacion.ciudad_id =  @ciudad.id
    @publicacion.user = current_user

    respond_to do |format|
      if @publicacion.save
        format.html { redirect_to pai_ciudad_publicacion_path(@ciudad.pai_id, @ciudad, @publicacion), notice: 'Publicacion was successfully created.' }
        format.json { render :show, status: :created, location: @publicacion }
      else
        format.html { render :new }
        format.json { render json: @publicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /publicacions/1
  # PATCH/PUT /publicacions/1.json
  def update
    respond_to do |format|
      if @publicacion.update(publicacion_params)
        format.html { redirect_to pai_ciudad_publicacion_path(@ciudad.pai_id, @ciudad.id, @publicacion), notice: 'Publicacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @publicacion }
      else
        format.html { render :edit }
        format.json { render json: @publicacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /publicacions/1
  # DELETE /publicacions/1.json
  def destroy
    @pai = Pai.find(params[:pai_id])
    @publicacion.destroy
    respond_to do |format|
      format.html { redirect_to pai_ciudad_publicacions_path(@pai, @publicacion.ciudad_id), notice: 'Publicacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @publicacion = Publicacion.find(params[:id])
    @publicacion.liked_by current_user
    @publicacion.calcular
    @publicacion.save
    redirect_back fallback_location: root_path
  end

  def downvote
    @publicacion = Publicacion.find(params[:id])
    @publicacion.disliked_by current_user
    @publicacion.calcular
    @publicacion.save
    redirect_back fallback_location: root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_publicacion
      @publicacion = Publicacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def publicacion_params
      params.require(:publicacion).permit(:titulo, :autor, :fecha, :tipo, :contenido)
    end

    #def require_online
    #  redirect_to root_url unless !current_user.nil?
    #end
    def set_ciudad
      @ciudad = Ciudad.find(params[:ciudad_id])
    end

end
