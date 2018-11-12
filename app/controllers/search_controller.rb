class SearchController < ApplicationController
  before_action :set_search, only: [:show, :edit, :update, :destroy]

  # GET /searches
  # GET /searches.json
  def index
    if not params[:crit] 
      return 
    end
    @publicacions = Publicacion.search(params[:crit]).limit(20).order("created_at DESC")
    @pais = Pai.search(params[:crit]).limit(20).order("created_at DESC")
    @ciudads = Ciudad.search(params[:crit]).limit(20).order("created_at DESC")
    @itinerarios = Itinerario.search(params[:crit]).limit(20).order("created_at DESC")
    @comentarios = Comentario.search(params[:crit]).limit(20).order("created_at DESC")
  end

  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_search
      @search = Search.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def search_params
      params.fetch(:search, {})
    end
end
