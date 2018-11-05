require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  # test "visiting the index" do
  #   visit questions_url
  #
  #   assert_selector "h1", text: "Questions"
  # end
  test "visiting /ask renders the form" do
    visit ask_url
    assert_selector "p", text: "Ask your coach anything"
  end

  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "submit"

    assert_text "I don't care, get dressed and go to work!"
  end

  test "asking a question with ? yields a 'silly' response" do
    visit ask_url
    fill_in "question", with: "What day is it?"
    click_on "submit"

    assert_text "Silly question, get dressed and go to work!"
    take_screenshot
  end

  test "saying 'I am going to work' yields a 'Great!' response" do
    visit ask_url
    fill_in "question", with: "I am going to work"
    click_on "submit"
    take_screenshot

    assert_text "Great!"
  end
end
