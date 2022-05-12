require 'pg'

feature 'displays list of bookmarks' do
  scenario 'user sees a list of bookmarks' do

    Bookmark_Library.create(url: 'http://www.makersacademy.com/')
    Bookmark_Library.create(url: 'http://www.destroyallsoftware.com/')
    Bookmark_Library.create(url: 'http://www.google.com/')

    visit '/bookmarks'
    expect(has_expected_content(page)).to be true
  end
  
end
