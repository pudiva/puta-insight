require "application_system_test_case"

class InsightsTest < ApplicationSystemTestCase
  setup do
    @insight = insights(:one)
  end

  test "visiting the index" do
    visit insights_url
    assert_selector "h1", text: "Insights"
  end

  test "creating a Insight" do
    visit insights_url
    click_on "New Insight"

    fill_in "Q1", with: @insight.q1
    fill_in "Q2", with: @insight.q2
    click_on "Create Insight"

    assert_text "Insight was successfully created"
    click_on "Back"
  end

  test "updating a Insight" do
    visit insights_url
    click_on "Edit", match: :first

    fill_in "Q1", with: @insight.q1
    fill_in "Q2", with: @insight.q2
    click_on "Update Insight"

    assert_text "Insight was successfully updated"
    click_on "Back"
  end

  test "destroying a Insight" do
    visit insights_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Insight was successfully destroyed"
  end
end
