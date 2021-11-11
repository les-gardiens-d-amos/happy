require "test_helper"

class CheckServiceTest < ActiveSupport::TestCase
  
  test "should save check service" do
    check = CheckService.new
    assert check.save, "Saved the the check service"
  end

  test "Delete all service" do
    CheckService.new.save
    CheckService.delete_all
    all_check = CheckService.all
    assert_equal([], all_check, "Return empty array")
  end
end
