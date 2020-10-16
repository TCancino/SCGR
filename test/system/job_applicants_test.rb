require "application_system_test_case"

class JobApplicantsTest < ApplicationSystemTestCase
  setup do
    @job_applicant = job_applicants(:one)
  end

  test "visiting the index" do
    visit job_applicants_url
    assert_selector "h1", text: "Job Applicants"
  end

  test "creating a Job applicant" do
    visit job_applicants_url
    click_on "New Job Applicant"

    fill_in "Other", with: @job_applicant.other
    fill_in "Phone", with: @job_applicant.phone
    fill_in "Specialization", with: @job_applicant.specialization
    fill_in "Work experience", with: @job_applicant.work_experience
    click_on "Create Job applicant"

    assert_text "Job applicant was successfully created"
    click_on "Back"
  end

  test "updating a Job applicant" do
    visit job_applicants_url
    click_on "Edit", match: :first

    fill_in "Other", with: @job_applicant.other
    fill_in "Phone", with: @job_applicant.phone
    fill_in "Specialization", with: @job_applicant.specialization
    fill_in "Work experience", with: @job_applicant.work_experience
    click_on "Update Job applicant"

    assert_text "Job applicant was successfully updated"
    click_on "Back"
  end

  test "destroying a Job applicant" do
    visit job_applicants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Job applicant was successfully destroyed"
  end
end
