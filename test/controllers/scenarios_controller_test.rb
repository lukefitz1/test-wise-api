require 'test_helper'

class ScenariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @scenario = scenarios(:one)
  end

  test "should get index" do
    get scenarios_url, as: :json
    assert_response :success
  end

  test "should create scenario" do
    assert_difference('Scenario.count') do
      post scenarios_url, params: { scenario: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show scenario" do
    get scenario_url(@scenario), as: :json
    assert_response :success
  end

  test "should update scenario" do
    patch scenario_url(@scenario), params: { scenario: {  } }, as: :json
    assert_response 200
  end

  test "should destroy scenario" do
    assert_difference('Scenario.count', -1) do
      delete scenario_url(@scenario), as: :json
    end

    assert_response 204
  end
end
