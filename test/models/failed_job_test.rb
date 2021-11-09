require "test_helper"

class FailedJobTest < ActiveSupport::TestCase
  setup do
    @data = {
      name: "error for test",
      description: "description for this error",
      error: "divided by zero for example",
      stack_trace: "./error/stack/trace/example.rb"
    }
  end

  test "should not save Job witouth data" do
    failed_job = FailedJob.new
    assert_not failed_job.save, "Dont save Job without data"
  end

  test "save Job" do
    failed_job = FailedJob.new(@data)
    assert failed_job.save, "save job"
  end

  test "find error by name" do
    FailedJob.new(@data).save
    job = FailedJob.find_by(name: "error for test")
    assert_not_equal(nil, job, "Return error with a name")
  end

  test "delete all failed job" do
    FailedJob.new(@data).save
    FailedJob.delete_all
    all_job = FailedJob.all
    assert_equal([], all_job, "Return empty array after delete all")
  end
end
