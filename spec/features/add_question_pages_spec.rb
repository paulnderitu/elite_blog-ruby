require 'rails_helper'

describe 'the add a question process' do
  it 'adds a new question' do
    visit questions_path
    click_link 'New Question'
    fill_in 'Title', with: 'Why me?'
    click_on 'Create Question'
    expect(page).to have_content 'Questions'
  end

  it 'gives error when no Title is entered' do
    visit new_question_path
    click_on 'Create Question'
    expect(page).to have_content 'errors'
  end
end
