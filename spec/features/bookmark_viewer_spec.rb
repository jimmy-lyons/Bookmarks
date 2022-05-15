require 'pg'

feature 'displays list of bookmarks' do
  scenario 'user sees a list of bookmarks' do

    Bookmarks.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
    Bookmarks.create(url: 'http://www.destroyallsoftware.com/', title: 'Destroy All Software')
    Bookmarks.create(url: 'http://www.google.com/', title: 'Google')

    visit '/bookmarks'
    expect(has_expected_content(page)).to be true
  end
end

feature 'has a button to add a new bookmark' do
  scenario 'user clicks add button and is taken to page to add new bookmark' do
    visit '/bookmarks'
    click_button 'Add'

    expect(current_path).to eq '/bookmarks/new'
  end
end
