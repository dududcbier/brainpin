require 'test_helper'

class MaterialsRatingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @materials_rating = materials_ratings(:one)
  end

  test "should get index" do
    get materials_ratings_url
    assert_response :success
  end

  test "should get new" do
    get new_materials_rating_url
    assert_response :success
  end

  test "should create materials_rating" do
    assert_difference('MaterialsRating.count') do
      post materials_ratings_url, params: { materials_rating: { material_id: @materials_rating.material_id, rating: @materials_rating.rating, student_id: @materials_rating.student_id } }
    end

    assert_redirected_to materials_rating_url(MaterialsRating.last)
  end

  test "should show materials_rating" do
    get materials_rating_url(@materials_rating)
    assert_response :success
  end

  test "should get edit" do
    get edit_materials_rating_url(@materials_rating)
    assert_response :success
  end

  test "should update materials_rating" do
    patch materials_rating_url(@materials_rating), params: { materials_rating: { material_id: @materials_rating.material_id, rating: @materials_rating.rating, student_id: @materials_rating.student_id } }
    assert_redirected_to materials_rating_url(@materials_rating)
  end

  test "should destroy materials_rating" do
    assert_difference('MaterialsRating.count', -1) do
      delete materials_rating_url(@materials_rating)
    end

    assert_redirected_to materials_ratings_url
  end
end
