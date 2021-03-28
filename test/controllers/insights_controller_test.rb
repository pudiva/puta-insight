require "test_helper"

class InsightsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insight = insights(:one)
  end

  test "should get index" do
    get insights_url
    assert_response :success
  end

  test "should get new" do
    get new_insight_url
    assert_response :success
  end

  test "should create insight" do
    assert_difference('Insight.count') do
      post insights_url, params: { insight: { q1: @insight.q1, q2: @insight.q2 } }
    end

    assert_redirected_to insight_url(Insight.last)
  end

  test "should show insight" do
    get insight_url(@insight)
    assert_response :success
  end

  test "should get edit" do
    get edit_insight_url(@insight)
    assert_response :success
  end

  test "should update insight" do
    patch insight_url(@insight), params: { insight: { q1: @insight.q1, q2: @insight.q2 } }
    assert_redirected_to insight_url(@insight)
  end

  test "should destroy insight" do
    assert_difference('Insight.count', -1) do
      delete insight_url(@insight)
    end

    assert_redirected_to insights_url
  end
end
