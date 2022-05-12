require 'pg'

feature 'displays list of bookmarks' do
  scenario 'user sees a list of bookmarks' do

    Bookmark_Library.create(url: 'http://www.makersacademy.com/', title: 'Makers Academy')
    Bookmark_Library.create(url: 'http://www.destroyallsoftware.com/', title: 'Destroy All Software')
    Bookmark_Library.create(url: 'http://www.google.com/', title: 'Google')

    visit '/bookmarks'
    expect(has_expected_content(page)).to be true
  end
  
end
