require "test_helper"

class AmosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @amo = amos(:one)
  end

  test "should get index" do
    get amos_url, as: :json
    assert_response :success
  end

  # test "should create amo" do
  #   assert_difference('Amo.count') do
  #     post amos_url, params: { 
  #       amo: { 
  #         user_id: @amo.user_id, 
  #         animal_id: @amo.animal_id, 
  #         species: @amo.species, 
  #         amos_type: @amo.amos_type, 
  #         name: @amo.name, 
  #         image_path: @amo.image_path 
  #       } 
  #     }, as: :json
  #   end

  #   assert_response 201
  # end

  test "should show amo" do
    get amo_url(@amo), as: :json
    assert_response :success
  end

  # test "should update amo" do
  #   patch amo_url(@amo), params: { 
  #     amo: { 
  #       user_id: @amo.user_id, 
  #       animal_id: @amo.animal_id, 
  #       species: @amo.species, 
  #       amos_type: @amo.amos_type, 
  #       name: @amo.name, 
  #       image_path: @amo.image_path 
  #     } 
  #   }, as: :json
  #   assert_response 200
  # end

  # test "should destroy amo" do
  #   assert_difference('Amo.count', -1) do
  #     delete amo_url(@amo), as: :json
  #   end

  #   assert_response 204
  # end
end
