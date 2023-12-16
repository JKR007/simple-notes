require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "name" do
    assert_equal "User_1", users(:user_1).name
  end
end
