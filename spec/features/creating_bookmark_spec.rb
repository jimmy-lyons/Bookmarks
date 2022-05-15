feature 'Adding a new bookmark' do
  scenario 'User adds a bookmark to the bookmark manager' do
    visit '/bookmarks/new'
    fill_in('url', with: 'http://example.org')
    fill_in('title', with: 'Example')
    click_button 'Submit'

    expect(page).to have_link('Example', href: 'http://example.org')
  end

  scenario 'The bookmark must be a valid URL' do
    visit('/bookmarks/new')
    fill_in('url', with: 'not a real bookmark')
    click_button('Submit')
  
    expect(page).not_to have_content "not a real bookmark"
    expect(page).to have_content "You must submit a valid URL."
  end
end