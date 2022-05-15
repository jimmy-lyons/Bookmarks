feature 'Updating a bookmark' do
  scenario 'A user can update a bookmark' do
    bookmark = Bookmarks.create(url: 'http://www.yahoo.com', title: 'Yahoo')
    visit '/bookmarks'
    expect(page).to have_link('Yahoo', href: 'http://www.yahoo.com')

    first('.bookmark').click_button 'Edit'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in 'url', with: 'http://www.github.com'
    fill_in 'title', with: 'Github'
    click_button 'Submit'

    expect(current_path).to eq "/bookmarks"
    expect(page).not_to have_link('Yahoo', href: 'http://www.yahoo.com')
    expect(page).to have_link('Github', href: 'http://www.github.com')
  end
end