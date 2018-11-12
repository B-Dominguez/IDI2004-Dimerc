class ComentariosController < ApplicationController
  before_action :set_comentario, only: [:show, :edit, :update, :destroy]
  before_action :set_publicacion, only: [:new, :create]

  # GET /comentarios
  # GET /comentarios.json
  def index
    @publicacion = Publicacion.find(params[:publicacion_id])
    @comentarios = @publicacion.comentarios
    @comentario = Comentario.search(params[:term])
  end

  # GET /comentarios/1
  # GET /comentarios/1.json
  def show
  end

  # GET /comentarios/new
  def new
    @comentario = Comentario.new
  end

  # GET /comentarios/1/edit
  def edit
  end

  # POST /comentarios
  # POST /comentarios.json
  def create
    @comentario = Comentario.new(comentario_params)
    @comentario.publicacion_id =  @publicacion.id
    @comentario.user = current_user

    if @comentario.save
        redirect_to pai_ciudad_publicacion_comentario_path(@publicacion.ciudad.pai_id, @publicacion.ciudad_id, @publicacion, @comentario)
    end
  end

  # PATCH/PUT /comentarios/1
  # PATCH/PUT /comentarios/1.json
  def update
    respond_to do |format|
      if @comentario.update(comentario_params)
        format.html { redirect_to publicacion_comentario_path(@publicacion, @comentario), notice: 'Comentario was successfully updated.' }
        format.json { render :show, status: :ok, location: @comentario }
      else
        format.html { render :edit }
        format.json { render json: @comentario.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comentarios/1
  # DELETE /comentarios/1.json
  def destroy
    @ciudad = Ciudad.find(params[:ciudad_id])
    @pai = Pai.find(params[:pai_id])
    @comentario.destroy
    respond_to do |format|
      format.html { redirect_to pai_ciudad_publicacion_comentarios_path(@pai, @ciudad, @comentario.publicacion_id), notice: 'Comentario was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @comentario = Comentario.find(params[:id])
    @comentario.upvote_by current_user
    @comentario.ptje_rep = @comentario.ptje + 1
    redirect_back fallback_location: root_path
  end

  def downvote
    @comentario = Comentario.find(params[:id])
    @comentario.downvote_by current_user
    redirect_back fallback_location: root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comentario
      @comentario = Comentario.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comentario_params
      params.require(:comentario).permit(:pertenece, :contenido, :ptje_rep, :fecha)
    end


    def require_online
      redirect_to root_url unless !current_user.nil?
    end


    def set_publicacion
      @publicacion = Publicacion.find(params[:publicacion_id])
    end

end
