require 'test_helper'

class JobApplicantsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @job_applicant = job_applicants(:one)
  end

  test "should get index" do
    get job_applicants_url
    assert_response :success
  end

  test "should get new" do
    get new_job_applicant_url
    assert_response :success
  end

  test "should create job_applicant" do
    assert_difference('JobApplicant.count') do
      post job_applicants_url, params: { job_applicant: { other: @job_applicant.other, phone: @job_applicant.phone, specialization: @job_applicant.specialization, work_experience: @job_applicant.work_experience } }
    end

    assert_redirected_to job_applicant_url(JobApplicant.last)
  end

  test "should show job_applicant" do
    get job_applicant_url(@job_applicant)
    assert_response :success
  end

  test "should get edit" do
    get edit_job_applicant_url(@job_applicant)
    assert_response :success
  end

  test "should update job_applicant" do
    patch job_applicant_url(@job_applicant), params: { job_applicant: { other: @job_applicant.other, phone: @job_applicant.phone, specialization: @job_applicant.specialization, work_experience: @job_applicant.work_experience } }
    assert_redirected_to job_applicant_url(@job_applicant)
  end

  test "should destroy job_applicant" do
    assert_difference('JobApplicant.count', -1) do
      delete job_applicant_url(@job_applicant)
    end

    assert_redirected_to job_applicants_url
  end
end
