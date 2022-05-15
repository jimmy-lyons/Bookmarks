feature 'Delete a bookmark' do
  scenario 'Deletes specific bookmark from Bookmark Manager' do
    bookmark = Bookmarks.create(url: 'http://www.yahoo.com', title: 'Yahoo')
    visit '/bookmarks'
    
    expect(page).to have_link('Yahoo', href: 'http://www.yahoo.com')

    first('.bookmark').click_button 'Delete'

    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Yahoo', href: 'http://www.yahoo.com')
  end
end