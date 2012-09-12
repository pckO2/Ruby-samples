require 'test_helper'

class MailControllerTest < ActionController::TestCase
  test "should get mail" do
    get :mail
    assert_response :success
  end

end
