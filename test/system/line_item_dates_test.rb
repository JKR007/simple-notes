require "application_system_test_case"

class LineItemDatesTest < ApplicationSystemTestCase
  setup do
    login_as users(:user_1)
    @note = notes(:first)
    @line_item_date = line_item_dates(:today)

    visit note_path(@note)
  end

  test "New Line Item Date Creation" do
    assert_selector "h1", text: "First Note"

    click_on "New Date"
    assert_selector "h1", text: "First Note"
    fill_in "Date",	with: Date.current + 1.day

    click_on "Create Date"
    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test "Update Line Item Date" do
    assert_selector "h1", text: "First Note"

    within id: dom_id(@line_item_date) do
      click_on "Edit"
    end

    fill_in "Date", with: Date.current + 1.day
    click_on "Update Date"

    assert_text I18n.l(Date.current + 1.day, format: :long)
  end

  test "Delete Line Item Date" do
    assert_selector "h1", text: "First Note"

    accept_confirm do
      within id: dom_id(@line_item_date) do
        click_on "Remove"
      end
    end

    assert_no_text I18n.l(Date.current, format: :long)
  end
end
