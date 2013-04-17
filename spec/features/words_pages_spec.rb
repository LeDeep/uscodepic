require 'spec_helper'

feature 'new word' do
  scenario 'with valid word' do
    create_word_sample
    page.should have_content "Enter definition:"
  end
end

feature 'show words' do
  scenario 'with seeded words' do
    create_word_with_definition
    page.should have_content "Test definition"
  end
end

