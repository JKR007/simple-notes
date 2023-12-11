require "application_system_test_case"

class NotesTest < ApplicationSystemTestCase
  setup do
    @note = notes(:second)
  end

  test "Create Note" do
    visit notes_path
    assert_selector "h1", text: "Notes"

    click_on "New Note"
    assert_selector "h1", text: "New Note"

    fill_in "Name", text: "Mortred is a carry hero"
    click_on "Create Note"

    assert_selector "h1", text: "Notes"
    assert_text "Mortred is a carry hero"
  end

  test "Show Note" do
    visit notes_path
    click_on @note.name

    assert_selector "h1", text: "Second note"
  end

  test "Updating Note" do
    visit notes_path
    assert_selector "h1", text: "Notes"

    click_on "Edit", match: :first
    assert_selector "h1", text: "Edit Note"

    fill_in "Name", with: "Second note - updated"
    click_on "Update Note"

    assert_selector "h1", text: "Notes"
    assert_text "Second note - updated"
  end

  test "Destroy Note" do
    visit notes_path
    assert_selector "h1", text: "Notes"
    assert_text @note.name

    click_on "Remove", match: :first
    assert_no_text @note.name
  end
end
