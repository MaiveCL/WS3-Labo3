require "test_helper"

class MesmenusControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get mesmenus_index_url
    assert_response :success
  end

  test "should get show" do
    get mesmenus_show_url
    assert_response :success
  end
end
