require 'test_helper'

class RestHoraControllerTest < ActionController::TestCase
  test "should get meniu_rest_hora" do
    get :meniu_rest_hora
    assert_response :success
  end

  test "should get afisare_rezerva" do
    get :afisare_rezerva
    assert_response :success
  end

end
