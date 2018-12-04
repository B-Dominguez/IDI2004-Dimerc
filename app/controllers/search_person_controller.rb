class SearchPersonController < ApplicationController
  def index
    @search = current_user.search_person
    @search.reset
  end

  def search_params
    params.require(:search_person).permit(:area, :nombre, :cargo)
  end

  def show
    @search = current_user.search_person
  end

  def update
    @search = current_user.search_person
    respond_to do |format|
      if @search.update(search_params)
        format.html { redirect_to search_person_results_path, notice: 'Search was successfully updated.' }
        format.json { render :show, status: :ok, location: search_person_results_path }
      else
        format.html { render :edit }
        format.json { render json: current_user.search_person.errors, status: :unprocessable_entity }
      end
    end
  end
end
