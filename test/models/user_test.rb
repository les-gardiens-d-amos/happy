require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @data = {
      id: SecureRandom.uuid,
      email: "plop@plop.com",
      name: "plop",
      password: "plop-man"
    }

    user_data = {
      id: SecureRandom.uuid,
      email: "plopi@gmail.com",
      name: "plopi",
      password: "plopiplopi"
    }

    @user = User.new(user_data).save
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
    user = User.find_by(name: "plopi")
    assert_not_equal(nil, user, "Return user with a name plop")
  end

  test "Find user by email" do
    user = User.find_by(email: "plopi@gmail.com")
    assert_not_equal(nil, user, "Return user with a email plop@plop.com")
  end

  test "Delete all user" do
    User.delete_all
    all_user = User.all
    assert_equal([], all_user, "Return empty array")
  end
end
