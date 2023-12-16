require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase
  setup do
    login_as users(:user_1)
    @note = notes(:second)
    @note_to_be_removed = notes(:first)
  end

  test "Create Note" do
    visit notes_path
    assert_selector "h1", text: "Notes"

    click_on "New Note"
    fill_in "Title", with: "Mortred is a carry hero"

    assert_selector "h1", text: "Notes"
    click_on "Create Note"

    assert_selector "h1", text: "Notes"
    assert_text "Mortred is a carry hero"
  end

  test "Show Note" do
    visit notes_path
    click_on @note.title

    assert_selector "h1", text: "Second Note"
  end

  test "Updating Note" do
    visit notes_path
    assert_selector "h1", text: "Notes"

    click_on "Edit", match: :first
    fill_in "Title", with: "Second Note - updated"

    assert_selector "h1", text: "Notes"
    click_on "Update Note"

    assert_selector "h1", text: "Notes"
    assert_text "Second Note - updated"
  end

  test "Destroy Note" do
    visit notes_path
    assert_text @note_to_be_removed.title

    click_on "Remove", match: :first
    assert_no_text @note_to_be_removed.title
  end
end
