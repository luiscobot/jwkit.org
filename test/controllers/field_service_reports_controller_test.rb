require "test_helper"

class FieldServiceReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get field_service_reports_new_url
    assert_response :success
  end
end
