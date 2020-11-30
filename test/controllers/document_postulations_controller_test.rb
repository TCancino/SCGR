require 'test_helper'

class DocumentPostulationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @document_postulation = document_postulations(:one)
  end

  test "should get index" do
    get document_postulations_url
    assert_response :success
  end

  test "should get new" do
    get new_document_postulation_url
    assert_response :success
  end

  test "should create document_postulation" do
    assert_difference('DocumentPostulation.count') do
      post document_postulations_url, params: { document_postulation: {  } }
    end

    assert_redirected_to document_postulation_url(DocumentPostulation.last)
  end

  test "should show document_postulation" do
    get document_postulation_url(@document_postulation)
    assert_response :success
  end

  test "should get edit" do
    get edit_document_postulation_url(@document_postulation)
    assert_response :success
  end

  test "should update document_postulation" do
    patch document_postulation_url(@document_postulation), params: { document_postulation: {  } }
    assert_redirected_to document_postulation_url(@document_postulation)
  end

  test "should destroy document_postulation" do
    assert_difference('DocumentPostulation.count', -1) do
      delete document_postulation_url(@document_postulation)
    end

    assert_redirected_to document_postulations_url
  end
end
