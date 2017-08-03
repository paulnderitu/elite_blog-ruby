require 'rails_helper'

describe 'the edit an answer process' do
  it 'edits an answer' do
    question = Question.create(title: 'Why me?')
    answer = Answer.create(description: 'Because you are chosen', question_id: question.id)
    visit question_path(question)
    click_on 'Edit'
    fill_in 'Description', with: 'You are special'
    click_on 'Update Answer'
    expect(page).to have_content 'You are special'
  end

  it 'gives error when no description is entered' do
    question = Question.create(title: 'Why me?')
    answer = Answer.create(description: 'Because you are chosen', question_id: question.id)
    visit question_path(question)
    click_on 'Edit'
    fill_in 'Description', with: ''
    click_button 'Update Answer'
    expect(page).to have_content 'errors'
  end
end
