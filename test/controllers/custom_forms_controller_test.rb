require 'test_helper'

class CustomFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @custom_form = custom_forms(:one)
  end

  test "should get index" do
    get custom_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_custom_form_url
    assert_response :success
  end

  test "should create custom_form" do
    assert_difference('CustomForm.count') do
      post custom_forms_url, params: { custom_form: { description: @custom_form.description, name: @custom_form.name } }
    end

    assert_redirected_to custom_form_url(CustomForm.last)
  end

  test "should show custom_form" do
    get custom_form_url(@custom_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_custom_form_url(@custom_form)
    assert_response :success
  end

  test "should update custom_form" do
    patch custom_form_url(@custom_form), params: { custom_form: { description: @custom_form.description, name: @custom_form.name } }
    assert_redirected_to custom_form_url(@custom_form)
  end

  test "should destroy custom_form" do
    assert_difference('CustomForm.count', -1) do
      delete custom_form_url(@custom_form)
    end

    assert_redirected_to custom_forms_url
  end
end
