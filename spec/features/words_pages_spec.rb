require 'spec_helper'

feature 'create a new word' do
  scenario 'with a signed-in user' do
    create_user_and_sign_in
    visit new_word_path
    fill_in 'word_term', :with => 'sample'
    click_button 'Submit'
    page.should have_content "Enter definition:"
  end

  scenario 'without a signed in user' do
    visit new_word_path
    page.should have_content 'Please sign in'
  end
end

feature 'list words words#index' do
  scenario 'with a signed-in user' do
    create_user_and_sign_in
    definition = FactoryGirl.create(:definition)
    visit words_path
    page.should have_content definition.word.term
  end

  scenario 'without a signed-in user' do
    visit words_path
    page.should have_content "Terms"
  end
end

feature 'show word' do
  scenario 'with definitions' do
    create_user_and_sign_in
    create_word_with_definition
    page.should have_content "Test definition"
  end

  scenario 'upvoting a word' do
    definition = FactoryGirl.create(:definition)
    visit word_path(definition.word)
    click_button "Vote Up"
    page.should have_content '1'
  end

  scenario 'definitions with no votes' do
    word = FactoryGirl.create(:word)
    current_definition = FactoryGirl.create(:definition, :word => word)
    popular_definition = FactoryGirl.create(:definition, :word => word)
    visit word_path(word)
    page.should_not have_content "Current Definition"
  end

  scenario 'showing definitions in vote order' do
    word = FactoryGirl.create(:word)
    current_definition = FactoryGirl.create(:definition, :word => word)
    popular_definition = FactoryGirl.create(:definition, :word => word)
    unpopular_definition = FactoryGirl.create(:definition, :word => word)
    1.times {FactoryGirl.create(:vote, :definition => unpopular_definition)}
    2.times {FactoryGirl.create(:vote, :definition => popular_definition)}
    3.times {FactoryGirl.create(:vote, :definition => current_definition)}
    visit word_path(word)
    popular_definition.text.should appear_before unpopular_definition.text
  end

  scenario 'adding a word but not a definition' do
    create_user_and_sign_in
    visit words_path
    click_button "Add a word"
    fill_in "word_term", :with => "Sample"
    click_button "Submit"
    page.should have_content "Skip"
  end
end
