require "application_system_test_case"

class PostulationsTest < ApplicationSystemTestCase
  setup do
    @postulation = postulations(:one)
  end

  test "visiting the index" do
    visit postulations_url
    assert_selector "h1", text: "Postulations"
  end

  test "should create postulation" do
    visit postulations_url
    click_on "New postulation"

    fill_in "Daypostulation", with: @postulation.daypostulation
    fill_in "Description", with: @postulation.description
    fill_in "Title", with: @postulation.title
    click_on "Create Postulation"

    assert_text "Postulation was successfully created"
    click_on "Back"
  end

  test "should update Postulation" do
    visit postulation_url(@postulation)
    click_on "Edit this postulation", match: :first

    fill_in "Daypostulation", with: @postulation.daypostulation.to_s
    fill_in "Description", with: @postulation.description
    fill_in "Title", with: @postulation.title
    click_on "Update Postulation"

    assert_text "Postulation was successfully updated"
    click_on "Back"
  end

  test "should destroy Postulation" do
    visit postulation_url(@postulation)
    click_on "Destroy this postulation", match: :first

    assert_text "Postulation was successfully destroyed"
  end
end
