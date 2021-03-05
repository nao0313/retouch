require 'test_helper'

class RetouchesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get retouches_index_url
    assert_response :success
  end

end
