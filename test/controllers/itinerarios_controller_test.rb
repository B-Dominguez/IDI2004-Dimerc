require 'test_helper'

class ItinerariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @itinerario = itinerarios(:one)
  end

  test "should get index" do
    get itinerarios_url
    assert_response :success
  end

  test "should get new" do
    get new_itinerario_url
    assert_response :success
  end

  test "should create itinerario" do
    assert_difference('Itinerario.count') do
      post itinerarios_url, params: { itinerario: { actividades: @itinerario.actividades, descripcion: @itinerario.descripcion, duracion: @itinerario.duracion, itid: @itinerario.itid, lugares: @itinerario.lugares, nombre: @itinerario.nombre } }
    end

    assert_redirected_to itinerario_url(Itinerario.last)
  end

  test "should show itinerario" do
    get itinerario_url(@itinerario)
    assert_response :success
  end

  test "should get edit" do
    get edit_itinerario_url(@itinerario)
    assert_response :success
  end

  test "should update itinerario" do
    patch itinerario_url(@itinerario), params: { itinerario: { actividades: @itinerario.actividades, descripcion: @itinerario.descripcion, duracion: @itinerario.duracion, itid: @itinerario.itid, lugares: @itinerario.lugares, nombre: @itinerario.nombre } }
    assert_redirected_to itinerario_url(@itinerario)
  end

  test "should destroy itinerario" do
    assert_difference('Itinerario.count', -1) do
      delete itinerario_url(@itinerario)
    end

    assert_redirected_to itinerarios_url
  end
end
