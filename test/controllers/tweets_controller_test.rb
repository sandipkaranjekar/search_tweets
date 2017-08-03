require 'test_helper'

class TweetsControllerTest < ActionController::TestCase
  test "should get search_with_gem" do
    get :search_with_gem
    assert_response :success
  end

  test "should get search_without_gem" do
    get :search_without_gem
    assert_response :success
  end

end
