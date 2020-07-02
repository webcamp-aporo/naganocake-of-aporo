require 'test_helper'

class Admins::ItemGenresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_item_genres_index_url
    assert_response :success
  end

  test "should get edit" do
    get admins_item_genres_edit_url
    assert_response :success
  end

end
