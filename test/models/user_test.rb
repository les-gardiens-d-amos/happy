require "test_helper"

class UserTest < ActiveSupport::TestCase
  setup do
    @data = {
      :id => SecureRandom.uuid,
      :email => "plop@plop.com",
      :name => "plop",
      :password => "plop-man"
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
    User.new(@data).save
    user = User.find_by_name("plop")
    assert_not_equal(nil, user, "Return user with a name plop")
  end

  test "Find user by email" do
    User.new(@data).save
    user = User.find_by_email("plop@plop.com")
    assert_not_equal(nil, user, "Return user with a email plop@plop.com")
  end
end
