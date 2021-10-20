require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @data = {
      "name" => "plop",
      "password" => "plop-man"
    }
  end

  test "should not save User withouth name" do
    user = User.new
    assert_not user.save, "Saved the user without a name"
  end

  test "save user" do
    
    user = User.new(@data)
    assert user.save, "Saved the user"
  end

  test "Find user by name" do
    user = User.new(@data)
    user.save
    all_user = User.find_user_by_name("plop")
    assert_not_equal(0, all_user.length, "Return all user with a name plop")
  end
end
