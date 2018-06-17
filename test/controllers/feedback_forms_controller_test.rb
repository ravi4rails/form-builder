require 'test_helper'

class FeedbackFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @feedback_form = feedback_forms(:one)
  end

  test "should get index" do
    get feedback_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_feedback_form_url
    assert_response :success
  end

  test "should create feedback_form" do
    assert_difference('FeedbackForm.count') do
      post feedback_forms_url, params: { feedback_form: { description: @feedback_form.description, name: @feedback_form.name } }
    end

    assert_redirected_to feedback_form_url(FeedbackForm.last)
  end

  test "should show feedback_form" do
    get feedback_form_url(@feedback_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_feedback_form_url(@feedback_form)
    assert_response :success
  end

  test "should update feedback_form" do
    patch feedback_form_url(@feedback_form), params: { feedback_form: { description: @feedback_form.description, name: @feedback_form.name } }
    assert_redirected_to feedback_form_url(@feedback_form)
  end

  test "should destroy feedback_form" do
    assert_difference('FeedbackForm.count', -1) do
      delete feedback_form_url(@feedback_form)
    end

    assert_redirected_to feedback_forms_url
  end
end
