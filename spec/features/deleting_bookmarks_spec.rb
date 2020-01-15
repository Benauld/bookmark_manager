# frozen_string_literal: true

feature 'Deleting a boomkmark' do
  scenario 'deletes record from file and redisplay without record when last record selected for deletion' do
    visit('/bookmark')
    fill_in('create_url', with: 'http://test.com')
    click_button('Add new')
    expect(page).to have_content 'http://test.com'
  end
end
