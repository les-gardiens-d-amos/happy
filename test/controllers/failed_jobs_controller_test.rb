require "test_helper"

class FailedJobsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @failed_job = failed_jobs(:one)
  end

  test "should get index" do
    get failed_jobs_url, as: :json
    assert_response :success
  end

  test "should create failed_job" do
    assert_difference('FailedJob.count') do
      post failed_jobs_url, params: { failed_job: { description: @failed_job.description, error: @failed_job.error, name: @failed_job.name, stack_trace: @failed_job.stack_trace } }, as: :json
    end

    assert_response 201
  end

  test "should show failed_job" do
    get failed_job_url(@failed_job), as: :json
    assert_response :success
  end

  test "should update failed_job" do
    patch failed_job_url(@failed_job), params: { failed_job: { description: @failed_job.description, error: @failed_job.error, name: @failed_job.name, stack_trace: @failed_job.stack_trace } }, as: :json
    assert_response 200
  end

  test "should destroy failed_job" do
    assert_difference('FailedJob.count', -1) do
      delete failed_job_url(@failed_job), as: :json
    end

    assert_response 204
  end
end
