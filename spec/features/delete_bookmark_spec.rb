feature 'Delete a bookmark' do
  scenario 'Deletes specific bookmark from Bookmark Manager' do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://example.org')
    fill_in('title', with: 'Example')
    click_button 'Submit'
    visit '/bookmarks/delete'

    fill_in('title', with: 'Example')
    click_button "Delete"
    expect(page).not_to have_link('Example', href: 'http://example.org')
  end
end