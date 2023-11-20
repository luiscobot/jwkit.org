require "test_helper"

class FieldServiceGroupControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get field_service_group_index_url
    assert_response :success
  end
end
