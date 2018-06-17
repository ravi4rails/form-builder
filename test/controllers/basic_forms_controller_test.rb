require 'test_helper'

class BasicFormsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @basic_form = basic_forms(:one)
  end

  test "should get index" do
    get basic_forms_url
    assert_response :success
  end

  test "should get new" do
    get new_basic_form_url
    assert_response :success
  end

  test "should create basic_form" do
    assert_difference('BasicForm.count') do
      post basic_forms_url, params: { basic_form: { description: @basic_form.description, name: @basic_form.name } }
    end

    assert_redirected_to basic_form_url(BasicForm.last)
  end

  test "should show basic_form" do
    get basic_form_url(@basic_form)
    assert_response :success
  end

  test "should get edit" do
    get edit_basic_form_url(@basic_form)
    assert_response :success
  end

  test "should update basic_form" do
    patch basic_form_url(@basic_form), params: { basic_form: { description: @basic_form.description, name: @basic_form.name } }
    assert_redirected_to basic_form_url(@basic_form)
  end

  test "should destroy basic_form" do
    assert_difference('BasicForm.count', -1) do
      delete basic_form_url(@basic_form)
    end

    assert_redirected_to basic_forms_url
  end
end
