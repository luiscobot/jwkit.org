require "test_helper"

class FieldServiceGroupsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get field_service_groups_index_url
    assert_response :success
  end
end
