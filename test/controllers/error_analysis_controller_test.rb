require "test_helper"

class ErrorAnalysisControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get error_analysis_new_url
    assert_response :success
  end
end
