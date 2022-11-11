require "application_system_test_case"

class QuestionsTest < ApplicationSystemTestCase
  test "visiting /ask renders the form" do
    visit ask_url
    assert_selector "p", text: "Ask your coach anything"
    take_screenshot
  end

  test "saying Hello yields a grumpy response from the coach" do
    visit ask_url
    fill_in "question", with: "Hello"
    click_on "Ask"

    take_screenshot
    assert_text "I don't care, get dressed and go to work!"
  end

  test 'saying i am going to work will receive a compliment from the coach' do
    visit ask_url
    fill_in 'question', with: 'i am going to work'
    click_on 'Ask'

    assert_text 'Great!'
    take_screenshot
  end

  test 'asking any question ending with ? will receive a similar response from the coach' do
    visit ask_url
    fill_in 'question', with: "how's the weather be like?"
    click_on 'Ask'

    assert_text 'Silly question, get dressed and go to work!'
    take_screenshot
  end
end
