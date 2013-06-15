require 'test_helper'

class HighlightsControllerTest < ActionController::TestCase
  setup do
    @highlight = highlights(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:highlights)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create highlight" do
    assert_difference('Highlight.count') do
      post :create, highlight: { page_url: @highlight.page_url, selected_text: @highlight.selected_text, surrounding_text: @highlight.surrounding_text, user_id: @highlight.user_id }
    end

    assert_redirected_to highlight_path(assigns(:highlight))
  end

  test "should show highlight" do
    get :show, id: @highlight
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @highlight
    assert_response :success
  end

  test "should update highlight" do
    patch :update, id: @highlight, highlight: { page_url: @highlight.page_url, selected_text: @highlight.selected_text, surrounding_text: @highlight.surrounding_text, user_id: @highlight.user_id }
    assert_redirected_to highlight_path(assigns(:highlight))
  end

  test "should destroy highlight" do
    assert_difference('Highlight.count', -1) do
      delete :destroy, id: @highlight
    end

    assert_redirected_to highlights_path
  end
end
