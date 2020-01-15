# frozen_string_literal: true

feature 'Creating a boomkmark' do
  scenario 'in bookmarks page take an input and create a new bookmark' do
    visit('/bookmark')
    fill_in('create_url', with: 'http://test.com')
    click_button('Add new')
    expect(page).to have_content 'http://test.com'
  end
end
