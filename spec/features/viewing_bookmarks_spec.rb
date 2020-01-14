feature "Viewing bookmarks" do
  scenario "allows viewing bookmarks" do
    visit('/')
    click_button 'View Bookmarks'
    expect(page).to have_content "Bookmark Manager\nId URL"
  end
end