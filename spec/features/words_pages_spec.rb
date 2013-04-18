require 'spec_helper'

feature 'create a new word' do
  scenario 'with a signed-in user' do
    create_user_and_sign_in
    create_word_sample
    page.should have_content "Enter definition:"
  end

  scenario 'without a signed in user' do
    visit new_word_path
    page.should have_content 'Please sign in'
  end
end

feature 'list words' do
  scenario 'with a signed-in user' do
    create_user_and_sign_in
    create_word_with_definition
    page.should have_content "Test definition"
  end

  scenario 'without a signed-in user' do
    visit words_path
    page.should have_content "Terms"
  end
end
